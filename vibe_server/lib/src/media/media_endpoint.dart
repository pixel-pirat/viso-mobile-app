import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

/// Stores uploaded photo/video bytes and returns a public URL. Backed by
/// Serverpod's default database-backed storage (see DatabaseCloudStorage) —
/// no external cloud storage account needed. Shared by post/story creation
/// (avatar uploads go through UserProfileEndpoint instead, which has its
/// own resizing logic).
class MediaEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Uploads [bytes] and returns its public URL. [fileExtension] should be
  /// a plain extension like 'jpg', 'png' or 'mp4' (no leading dot).
  Future<String> upload(
    final Session session,
    final ByteData bytes,
    final String fileExtension,
  ) async {
    final myId = session.authenticated!.authUserId;
    final safeExtension = fileExtension.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
    final path =
        'media/$myId/${DateTime.now().microsecondsSinceEpoch}.$safeExtension';

    await session.storage.storeFile(
      storageId: 'public',
      path: path,
      byteData: bytes,
    );

    final url = await session.storage.getPublicUrl(
      storageId: 'public',
      path: path,
    );

    if (url == null) {
      throw Exception('Failed to resolve a public URL for the uploaded file.');
    }

    return url.toString();
  }
}
