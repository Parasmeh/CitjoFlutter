import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Theme/app_colors.dart';
import '../models/Comment.dart';
import '../models/User.dart';
import '../routes/routes_path.dart';
import '../services/get_it_service.dart';
import '../services/navigation_service.dart';
import '../stores/userStore.dart';
import 'profile_pic.dart';

class CommentSection extends StatefulWidget {
  final String postId;

  CommentSection({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _controller = TextEditingController();

  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  @override
  void dispose() {
    _controller.dispose(); // You need to do this.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Stack(
        children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.chevron_left_rounded,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                // height: MediaQuery.of(context).size.height * 0.6,
                // padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Consumer<UserStore>(builder: (_, userStore, __) {
                    List<Comment> comments = userStore.postComments;
                    print('Comments Count: ' + comments.length.toString());
                    print(comments);

                    return ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          Provider.of<UserStore>(context, listen: false)
                              .fetchCommentUser(comments[index].userId!);
                          User commentUser = userStore.commentUser;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await Provider.of<UserStore>(context,
                                              listen: false)
                                          .fetchOtherUser(commentUser.id);
                                      _navigationService
                                          .navigateTo(RoutePath.ViewProfile);
                                    },
                                    child: Row(
                                      children: [
                                        ProfilePic(
                                            picUrl: commentUser.profilePicUrl!,
                                            name: ''),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            commentUser.username!,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2),
                                    child: Icon(
                                      Icons.circle,
                                      size: 6,
                                    ),
                                  ),
                                  Text('1hr'),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  comments[index].commentText!,
                                  style: const TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {},
                              //       child: const Icon(
                              //         Icons.thumb_up_alt_outlined,
                              //         size: 16,
                              //       ),
                              //     ),
                              //     // GestureDetector(
                              //     //   onTap: () {},
                              //     //   child: const Text(
                              //     //     'Reply',
                              //     //     style: TextStyle(
                              //     //       fontFamily: 'Open Sans',
                              //     //       fontSize: 10,
                              //     //       fontWeight: FontWeight.w600,
                              //     //     ),
                              //     //   ),
                              //     // ),
                              //   ],
                              // ),
                              const Divider(thickness: 1),
                            ],
                          );
                        });
                  }),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 40,
                  child: Material(
                    color: AppColors.white,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        suffixIcon: TextButton(
                          child: const Text(
                            'Post',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            print(_controller.text);
                            Provider.of<UserStore>(context, listen: false)
                                .createComment(widget.postId, _controller.text);
                            _controller.clear();
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Comment',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
