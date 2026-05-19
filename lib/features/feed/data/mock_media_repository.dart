import 'dart:async';

import 'package:b_log/features/feed/domain/media_item.dart';

import 'media_repository.dart';

class MockMediaRepository implements MediaRepository {
  final List<MediaItem> _items = [
    MediaItem(
      id: 'm1',
      familyId: 'f1',
      uploaderName: '엄마',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1503919545889-aef636e10ad4?w=1200',
      caption: '오늘 첫 이유식! 표정이 너무 귀여웠어요.',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      type: MediaType.image,
      likeCount: 18,
      commentCount: 4,
    ),
    MediaItem(
      id: 'm2',
      familyId: 'f1',
      uploaderName: '아빠',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1476703993599-0035a21b17a9?w=1200',
      caption: '할머니랑 영상통화 후 방긋 웃음 :)',
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      type: MediaType.video,
      likeCount: 23,
      commentCount: 7,
    ),
    MediaItem(
      id: 'm3',
      familyId: 'f1',
      uploaderName: '할머니',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1516627145497-ae6968895b74?w=1200',
      caption: '낮잠 자기 전에 책 읽는 시간',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      type: MediaType.image,
      likeCount: 9,
      commentCount: 2,
    ),
  ];

  @override
  Future<List<MediaItem>> fetchTimeline({required String familyId}) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    return _items.where((item) => item.familyId == familyId).toList();
  }

  @override
  Future<MediaItem?> findById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    for (final item in _items) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  @override
  Future<void> toggleLike(String mediaId) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));

    for (var i = 0; i < _items.length; i++) {
      final item = _items[i];
      if (item.id == mediaId) {
        final nextLiked = !item.isLiked;
        final nextCount = nextLiked ? item.likeCount + 1 : item.likeCount - 1;
        _items[i] = item.copyWith(
          isLiked: nextLiked,
          likeCount: nextCount < 0 ? 0 : nextCount,
        );
        return;
      }
    }
  }
}
