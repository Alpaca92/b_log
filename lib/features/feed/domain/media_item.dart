enum MediaType { image, video }

class MediaItem {
  const MediaItem({
    required this.id,
    required this.familyId,
    required this.uploaderName,
    required this.thumbnailUrl,
    required this.caption,
    required this.createdAt,
    required this.type,
    this.isLiked = false,
    this.likeCount = 0,
    this.commentCount = 0,
  });

  final String id;
  final String familyId;
  final String uploaderName;
  final String thumbnailUrl;
  final String caption;
  final DateTime createdAt;
  final MediaType type;
  final bool isLiked;
  final int likeCount;
  final int commentCount;

  MediaItem copyWith({bool? isLiked, int? likeCount, int? commentCount}) {
    return MediaItem(
      id: id,
      familyId: familyId,
      uploaderName: uploaderName,
      thumbnailUrl: thumbnailUrl,
      caption: caption,
      createdAt: createdAt,
      type: type,
      isLiked: isLiked ?? this.isLiked,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
    );
  }
}
