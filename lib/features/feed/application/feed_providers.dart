import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/media_repository.dart';
import '../data/mock_media_repository.dart';
import '../domain/media_item.dart';

final mediaRepositoryProvider = Provider<MediaRepository>((ref) {
  return MockMediaRepository();
});

final timelineProvider = FutureProvider.autoDispose<List<MediaItem>>((ref) {
  final repository = ref.watch(mediaRepositoryProvider);
  return repository.fetchTimeline(familyId: 'f1');
});

final mediaByIdProvider = FutureProvider.autoDispose.family<MediaItem?, String>(
  (ref, mediaId) {
    final repository = ref.watch(mediaRepositoryProvider);
    return repository.findById(mediaId);
  },
);
