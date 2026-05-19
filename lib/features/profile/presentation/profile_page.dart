import 'package:b_log/core/layout/main_scaffold.dart';
import 'package:b_log/core/routes/index.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: TabRoute.profile.index,
      title: TabRoute.profile.label,
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.cloud_done_outlined),
            title: Text('Google Drive 연결 상태'),
            subtitle: Text('연결 전 (MVP 연동 예정)'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.shield_outlined),
            title: Text('개인정보 및 권한'),
            subtitle: Text('Firebase Auth + Firestore Rule 적용 예정'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.developer_mode_outlined),
            title: Text('현재 데이터 소스'),
            subtitle: Text('Mock Repository'),
          ),
        ],
      ),
    );
  }
}
