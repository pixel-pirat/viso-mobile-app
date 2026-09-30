import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../generated/protocol.dart';

/// Stories: 24h-expiring photo/video updates, grouped by author, with
/// seen/view tracking. Mirrors the pattern used by [PostEndpoint].
class StoryEndpoint extends Endpoint {
  final UserProfiles _userProfiles = const UserProfiles();

  @override
  bool get requireLogin => true;

  /// Creates a story. [mediaUrl] should already be uploaded via
  /// [MediaEndpoint.upload]. Expires 24 hours from now.
  Future<Story> createStory(
    final Session session,
    final String mediaUrl,
    final String mediaType,
  ) async {
    final myId = session.authenticated!.authUserId;
    final now = DateTime.now().toUtc();

    return Story.db.insertRow(
      session,
      Story(
        authorId: myId,
        mediaUrl: mediaUrl,
        mediaType: mediaType,
        createdAt: now,
        expiresAt: now.add(const Duration(hours: 24)),
      ),
    );
  }

  /// Returns active (non-expired) stories grouped by author. The signed-in
  /// user's own group (if any) always comes first; the rest are ordered
  /// unseen-first, then by most recent story.
  Future<List<StoryGroup>> getStoriesFeed(final Session session) async {
    final myId = session.authenticated!.authUserId;
    final now = DateTime.now().toUtc();

    final stories = await Story.db.find(
      session,
      where: (final t) => t.expiresAt > now,
      orderBy: (final t) => t.createdAt,
      orderDescending: false,
    );
    if (stories.isEmpty) return [];

    final storyIds = stories.map((final s) => s.id!).toSet();
    final myViews = await StoryView.db.find(
      session,
      where: (final t) => t.viewerId.equals(myId) & t.storyId.inSet(storyIds),
    );
    final seenStoryIds = myViews.map((final v) => v.storyId).toSet();

    final authorIds = stories.map((final s) => s.authorId).toSet();
    final profileCache = <UuidValue, UserProfileModel?>{};
    for (final authorId in authorIds) {
      profileCache[authorId] = await _userProfiles.maybeFindUserProfileByUserId(
        session,
        authorId,
      );
    }

    final byAuthor = <UuidValue, List<Story>>{};
    for (final story in stories) {
      byAuthor.putIfAbsent(story.authorId, () => []).add(story);
    }

    final groups = <StoryGroup>[];
    for (final entry in byAuthor.entries) {
      final authorId = entry.key;
      final authorStories = entry.value;
      final profile = profileCache[authorId];
      final hasUnseen = authorStories.any(
        (final s) => !seenStoryIds.contains(s.id),
      );

      groups.add(
        StoryGroup(
          authorId: authorId,
          authorName:
              profile?.fullName ??
              profile?.userName ??
              profile?.email?.split('@').first ??
              'Unknown user',
          authorAvatarUrl: profile?.imageUrl?.toString(),
          hasUnseen: hasUnseen,
          stories: authorStories
              .map(
                (final s) => StoryItem(
                  id: s.id!,
                  mediaUrl: s.mediaUrl,
                  mediaType: s.mediaType,
                  createdAt: s.createdAt,
                  viewCount: s.viewCount,
                  isSeenByMe: seenStoryIds.contains(s.id),
                ),
              )
              .toList(),
        ),
      );
    }

    groups.sort((final a, final b) {
      if (a.authorId == myId) return -1;
      if (b.authorId == myId) return 1;
      if (a.hasUnseen != b.hasUnseen) return a.hasUnseen ? -1 : 1;
      final aLatest = a.stories.last.createdAt;
      final bLatest = b.stories.last.createdAt;
      return bLatest.compareTo(aLatest);
    });

    return groups;
  }

  /// Marks [storyId] as viewed by the signed-in user (idempotent) and bumps
  /// its view count the first time.
  Future<void> markStoryViewed(final Session session, final int storyId) async {
    final myId = session.authenticated!.authUserId;

    final existing = await StoryView.db.findFirstRow(
      session,
      where: (final t) => t.storyId.equals(storyId) & t.viewerId.equals(myId),
    );
    if (existing != null) return;

    await StoryView.db.insertRow(
      session,
      StoryView(storyId: storyId, viewerId: myId),
    );

    final story = await Story.db.findById(session, storyId);
    if (story == null) return;
    story.viewCount += 1;
    await Story.db.updateRow(session, story);
  }
}
