import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';
import 'feed.dart';
import 'profile_pic.dart';

class RePost extends StatelessWidget {
  const RePost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(52),
                            child: Image.network(
                                "https://images.unsplash.com/photo-1498529605908-f357a9af7bf5?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=047fade70e80ebb22ac8f09c04872c40")),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Cherry Jain',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.merge(const TextStyle(color: AppColors.black)),
                        ),
                      ),
                    ],
                  ),
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
                      return MoreOptionSection(
                        userId: '',
                        postId: '',
                        videoUrl: '',
                      );
                    },
                  );
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              "Gluttonus cosmic 'black widow' is heaviest - known neutron star",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.merge(const TextStyle(color: AppColors.black)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            ProfilePic(
                                picUrl:
                                    'https://t4.ftcdn.net/jpg/02/58/29/09/360_F_258290955_48MCm6IcnSN3sodcIoOMXnucbTpsFiI9.jpg',
                                name: "India Tv"),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: const Image(
                    image: AssetImage('assets/images/plane.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    'IA to finally retire four existing MiG-21 squadrons by 2025',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.merge(const TextStyle(color: AppColors.black)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment_bank_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
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
      ),
    );
  }
}
