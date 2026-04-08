import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../feed/application/feed_providers.dart';
import '../../feed/domain/media_item.dart';

class MediaDetailPage extends ConsumerWidget {
  const MediaDetailPage({required this.mediaId, super.key});

  final String mediaId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaAsync = ref.watch(mediaByIdProvider(mediaId));
    final formatter = DateFormat('yyyy.MM.dd HH:mm');

    return Scaffold(
      appBar: AppBar(title: const Text('미디어 상세')),
      body: mediaAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('상세 데이터를 불러오지 못했습니다.\n$error')),
        data: (item) {
          if (item == null) {
            return const Center(child: Text('해당 미디어를 찾을 수 없습니다.'));
          }

          return ListView(
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
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
                    if (item.type == MediaType.video)
                      const Center(
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.black54,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  item.caption,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${item.uploaderName} · ${formatter.format(item.createdAt)}',
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FilledButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('MVP에서는 다운로드 UI만 연결되어 있습니다.'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.download),
                  label: const Text('원본 다운로드'),
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('댓글 (Mock)'),
              ),
              const ListTile(
                leading: CircleAvatar(child: Text('엄')),
                title: Text('너무 귀엽다!'),
                subtitle: Text('방금 전'),
              ),
              const ListTile(
                leading: CircleAvatar(child: Text('할')),
                title: Text('오늘도 보고 힘내요 :)'),
                subtitle: Text('2시간 전'),
              ),
            ],
          );
        },
      ),
    );
  }
}
