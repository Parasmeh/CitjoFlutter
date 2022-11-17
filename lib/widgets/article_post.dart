import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';
import 'feed.dart';
import 'profile_pic.dart';

class ArticlePost extends StatelessWidget {
  const ArticlePost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  ProfilePic(
                      picUrl:
                          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201906/aajtak.jpeg?Nq9I..DGOTZdCekaix7UWi1irdM5EM56',
                      name: "India Tv"),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return MoreOptionSection(postId: '', videoUrl: '', userId: '',);
                  },
                );
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        Text(
          'Researchers to have said the neutron star classified as a black widow has a mass about 2.35 times greater than that of our #sun - perhaps the maximum possible for such obejcts before they collapse to form a #blackhole',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.merge(const TextStyle(color: AppColors.black)),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up_outlined, size: 16),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.comment_bank_outlined, size: 16),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border, size: 16),
            ),
          ],
        ),
        Text(
          '1,234 likes, 28 comments',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.merge(const TextStyle(color: AppColors.black)),
        ),
      ],
    );
  }
}
