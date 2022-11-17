import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Theme/app_colors.dart';
import '../stores/userStore.dart';

class ReportSection extends StatelessWidget {
  final String postId;

  const ReportSection({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Report'),
          Container(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ReportOption(title: 'Copyright infringement', postId: postId),
                  ReportOption(title: 'False / Incorrect News', postId: postId),
                  ReportOption(
                      title: 'Violent / Hateful Content', postId: postId),
                  ReportOption(title: 'Political Biased', postId: postId),
                  ReportOption(
                      title: 'Adult / Nudity / Sexual Content', postId: postId),
                  ReportOption(
                      title: 'Harming / abusing minors', postId: postId),
                  ReportOption(
                      title: 'cam / Fraud / Misleading content',
                      postId: postId),
                  ReportOption(title: 'Bullying / Harassment', postId: postId),
                  ReportOption(title: 'Hate speech or symbols', postId: postId),
                  ReportOption(title: 'Suicide or self-injury', postId: postId),
                  ReportOption(title: 'Spam content', postId: postId),
                  ReportOption(title: 'Other', postId: postId),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportOption extends StatelessWidget {
  final String title;
  final String postId;

  const ReportOption({
    Key? key,
    required this.title,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        await Provider.of<UserStore>(context, listen: false)
            .reportPost(postId, title);
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.merge(const TextStyle(color: AppColors.grey)),
          ),
        ],
      ),
    );
  }
}
