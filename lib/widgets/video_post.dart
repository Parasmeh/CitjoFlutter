import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';
import '../models/User.dart';
import 'more_options.dart';
import 'profile_pic.dart';

class VideoPost extends StatelessWidget {
  final String title;
  final String videoUrl;
  final String thumbUrl;
  final List likes;
  final User postUser;

  // final List comments;

  VideoPost({
    Key? key,
    required this.title,
    required this.videoUrl,
    required this.thumbUrl,
    required this.likes,
    required this.postUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(thumbUrl);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image(image: NetworkImage(thumbUrl)),
                // child: NetworkPlayerController(videoUrl: videoUrl),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ProfilePic(picUrl: postUser.profilePicUrl!, name: ""),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          postUser.username!,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return const MoreOptionSection();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.thumb_up_outlined),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${likes.length}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.merge(const TextStyle(color: AppColors.black)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.comment_bank_outlined),
                    SizedBox(width: 8),
                    Text(
                      '${likes.length}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.merge(const TextStyle(color: AppColors.black)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.bookmark_border),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          title,
          overflow: TextOverflow.clip,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.merge(const TextStyle(color: AppColors.black)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Divider(thickness: 2),
        ),
      ],
    );
  }
}
