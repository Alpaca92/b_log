import 'package:flutter/material.dart';

import '../../../core/layout/main_scaffold.dart';

class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 1,
      title: '가족 관리',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Text('M')),
              title: const Text('엄마 (Master)'),
              subtitle: const Text('권한: 보기, 업로드, 수정, 삭제, 멤버 관리'),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('권한 수정'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Text('D')),
              title: const Text('아빠'),
              subtitle: const Text('권한: 보기, 업로드, 다운로드'),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('권한 수정'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Text('G')),
              title: const Text('할머니'),
              subtitle: const Text('권한: 보기, 댓글, 좋아요, 다운로드'),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('권한 수정'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('초대 링크 생성 UI는 다음 단계에서 연결합니다.')),
              );
            },
            icon: const Icon(Icons.link),
            label: const Text('가족 초대 링크 만들기'),
          ),
        ],
      ),
    );
  }
}
