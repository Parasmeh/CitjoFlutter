import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';
import 'article_post.dart';
import 're_post.dart';

class Widgets extends StatefulWidget {
  static const String id = 'Widgets';

  const Widgets({Key? key}) : super(key: key);

  @override
  State<Widgets> createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const ArticlePost(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 0.4,
                color: AppColors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 0.4,
                color: AppColors.grey),
          ),
          const RePost(),
        ],
      ),
    );
  }
}
