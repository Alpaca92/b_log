import '../domain/media_item.dart';

abstract interface class MediaRepository {
  Future<List<MediaItem>> fetchTimeline({required String familyId});
  Future<MediaItem?> findById(String id);
  Future<void> toggleLike(String mediaId);
}
