import 'dart:math';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../generated/protocol.dart';

/// Real post creation, a ranked feed, likes and view counts.
class PostEndpoint extends Endpoint {
  final UserProfiles _userProfiles = const UserProfiles();

  @override
  bool get requireLogin => true;

  /// Creates a post. [mediaUrls] should already be uploaded via
  /// [MediaEndpoint.upload]. [mediaType] is 'none', 'image' or 'video'.
  Future<Post> createPost(
    final Session session,
    final String text,
    final List<String> mediaUrls,
    final String mediaType,
  ) async {
    final myId = session.authenticated!.authUserId;
    final trimmed = text.trim();
    if (trimmed.isEmpty && mediaUrls.isEmpty) {
      throw ArgumentError('A post needs text or at least one photo/video.');
    }

    return Post.db.insertRow(
      session,
      Post(
        authorId: myId,
        text: trimmed,
        mediaUrls: mediaUrls,
        mediaType: mediaUrls.isEmpty ? 'none' : mediaType,
      ),
    );
  }

  /// Returns a ranked feed of recent posts. Ranking is a simple, explainable
  /// "hot" score: engagement (likes + weighted comments) decayed by how long
  /// ago the post was made, so fresh posts with traction rise to the top
  /// without older popular posts dominating forever. This is intentionally
  /// simple and easy to retune as real usage data comes in.
  Future<List<PostFeedItem>> getFeed(
    final Session session, {
    required final int limit,
    required final int offset,
  }) async {
    final myId = session.authenticated!.authUserId;

    // Pull a recent window to rank in memory; fine at current scale and
    // keeps the ranking formula simple to read/tune.
    final posts = await Post.db.find(
      session,
      orderBy: (final t) => t.createdAt,
      orderDescending: true,
      limit: 300,
    );

    final now = DateTime.now().toUtc();
    final ranked = [...posts]
      ..sort((final a, final b) {
        double score(final Post p) {
          final hoursOld = now.difference(p.createdAt).inMinutes / 60.0;
          final engagement = p.likeCount + p.commentCount * 1.5;
          return engagement / pow(hoursOld + 2, 1.5);
        }

        return score(b).compareTo(score(a));
      });

    final page = ranked.skip(offset).take(limit).toList();
    return _toFeedItems(session, page, myId);
  }

  /// Returns the signed-in user's own posts, most recent first — used by
  /// the Profile screen's Posts tab and the Analytics screen.
  Future<List<PostFeedItem>> getMyPosts(final Session session) async {
    final myId = session.authenticated!.authUserId;
    final posts = await Post.db.find(
      session,
      where: (final t) => t.authorId.equals(myId),
      orderBy: (final t) => t.createdAt,
      orderDescending: true,
      limit: 100,
    );
    return _toFeedItems(session, posts, myId);
  }

  Future<List<PostFeedItem>> _toFeedItems(
    final Session session,
    final List<Post> posts,
    final UuidValue myId,
  ) async {
    if (posts.isEmpty) return [];

    final postIds = posts.map((final p) => p.id!).toSet();
    final myLikes = await PostLike.db.find(
      session,
      where: (final t) => t.userId.equals(myId) & t.postId.inSet(postIds),
    );
    final likedPostIds = myLikes.map((final l) => l.postId).toSet();

    final authorIds = posts.map((final p) => p.authorId).toSet();
    final profileCache = <UuidValue, UserProfileModel?>{};
    for (final authorId in authorIds) {
      profileCache[authorId] = await _userProfiles.maybeFindUserProfileByUserId(
        session,
        authorId,
      );
    }

    final items = <PostFeedItem>[];
    for (final post in posts) {
      final profile = profileCache[post.authorId];
      items.add(
        PostFeedItem(
          id: post.id!,
          authorId: post.authorId,
          authorName:
              profile?.fullName ??
              profile?.userName ??
              profile?.email?.split('@').first ??
              'Unknown user',
          authorUserName: profile?.userName,
          authorAvatarUrl: profile?.imageUrl?.toString(),
          text: post.text,
          mediaUrls: post.mediaUrls,
          mediaType: post.mediaType,
          createdAt: post.createdAt,
          likeCount: post.likeCount,
          commentCount: post.commentCount,
          viewCount: post.viewCount,
          isLikedByMe: likedPostIds.contains(post.id),
        ),
      );
    }
    return items;
  }

  /// Toggles whether the signed-in user likes [postId]. Returns the new
  /// like count.
  Future<int> toggleLike(final Session session, final int postId) async {
    final myId = session.authenticated!.authUserId;

    return DatabaseUtil.runInTransactionOrSavepoint(session.db, null, (
      final transaction,
    ) async {
      final post = await Post.db.findById(
        session,
        postId,
        transaction: transaction,
      );
      if (post == null) throw ArgumentError('Post not found.');

      final existing = await PostLike.db.findFirstRow(
        session,
        where: (final t) => t.postId.equals(postId) & t.userId.equals(myId),
        transaction: transaction,
      );

      if (existing != null) {
        await PostLike.db.deleteRow(
          session,
          existing,
          transaction: transaction,
        );
        post.likeCount = post.likeCount > 0 ? post.likeCount - 1 : 0;
      } else {
        await PostLike.db.insertRow(
          session,
          PostLike(postId: postId, userId: myId),
          transaction: transaction,
        );
        post.likeCount += 1;
      }

      await Post.db.updateRow(session, post, transaction: transaction);
      return post.likeCount;
    });
  }

  /// Increments the view count for [postId]. Best-effort: the client calls
  /// this once per post per session, so counts are approximate, not a
  /// unique-viewer count.
  Future<void> recordView(final Session session, final int postId) async {
    final post = await Post.db.findById(session, postId);
    if (post == null) return;
    post.viewCount += 1;
    await Post.db.updateRow(session, post);
  }
}
