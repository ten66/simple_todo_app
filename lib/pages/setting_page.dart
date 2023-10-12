import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("設定"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                _SingleSection(
                  title: "アプリについて",
                  children: [
                    _CustomListTile(
                      title: "テーマカラー",
                      icon: CupertinoIcons.paintbrush,
                    ),
                    _CustomListTile(
                      title: "アプリを評価する",
                      icon: CupertinoIcons.star,
                    ),
                  ],
                ),
                _SingleSection(
                  title: "コンタクト",
                  children: [
                    _CustomListTile(
                      title: "機能要望",
                      icon: CupertinoIcons.bubble_left,
                    ),
                    _CustomListTile(
                      title: "不具合のご連絡",
                      icon: CupertinoIcons.exclamationmark_bubble,
                    ),
                    _CustomListTile(
                      title: "その他お問い合わせ",
                      icon: CupertinoIcons.envelope,
                    ),
                  ],
                ),
                _SingleSection(
                  title: "その他",
                  children: [
                    _CustomListTile(
                      title: "利用規約",
                      icon: CupertinoIcons.text_justify,
                    ),
                    _CustomListTile(
                      title: "プライバシーポリシー",
                      icon: CupertinoIcons.lock,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  const _CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: const Icon(CupertinoIcons.forward, size: 18),
      onTap: () {},
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kTodoCardColor,
          ),
          width: double.infinity,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
