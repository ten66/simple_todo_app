import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:simple_todo_app/constants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '設定',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('テーマカラー'),
            tiles: [
              SettingsTile.navigation(
                title: const Text('TODOリスト画面'),
              ),
              SettingsTile.navigation(
                title: const Text('設定画面'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('アプリについて'),
            tiles: [
              SettingsTile.navigation(
                title: const Text('アプリを評価する'),
              ),
              SettingsTile.navigation(
                title: const Text('利用規約'),
              ),
              SettingsTile.navigation(
                title: const Text('プライバシーポリシー'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('コンタクト'),
            tiles: [
              SettingsTile.navigation(
                title: const Text('機能要望'),
              ),
              SettingsTile.navigation(
                title: const Text('不具合のご連絡'),
              ),
              SettingsTile.navigation(
                title: const Text('その他お問い合わせ'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
