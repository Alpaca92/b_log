import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/layout/main_scaffold.dart';
import '../application/feed_providers.dart';
import '../domain/media_item.dart';

class FeedPage extends ConsumerWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timelineAsync = ref.watch(timelineProvider);

    return MainScaffold(
      currentIndex: 0,
      title: '우리 가족 타임라인',
      body: timelineAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, _) => Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('피드를 불러오지 못했습니다.\n$error'),
              ),
            ),
        data:
            (items) => ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final item = items[index];
                return _FeedCard(item: item);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: items.length,
            ),
      ),
    );
  }
}

class _FeedCard extends ConsumerWidget {
  const _FeedCard({required this.item});

  final MediaItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = DateFormat('M/d HH:mm');

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/media/${item.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(
                    item.thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color:
                            Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                        alignment: Alignment.center,
                        child: const Icon(Icons.image_not_supported_outlined),
                      );
                    },
                  ),
                ),
                if (item.type == MediaType.video)
                  const Positioned(
                    right: 12,
                    bottom: 12,
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Icon(Icons.play_arrow, color: Colors.white),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              child: Text(
                item.caption,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '${item.uploaderName} · ${formatter.format(item.createdAt)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      final repository = ref.read(mediaRepositoryProvider);
                      await repository.toggleLike(item.id);
                      ref.invalidate(timelineProvider);
                    },
                    icon: Icon(
                      item.isLiked ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                  Text('${item.likeCount}'),
                  const SizedBox(width: 12),
                  const Icon(Icons.chat_bubble_outline, size: 20),
                  const SizedBox(width: 4),
                  Text('${item.commentCount}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
