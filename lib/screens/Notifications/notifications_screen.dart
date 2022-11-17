import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/notifications.dart';
import '../../widgets/profile_pic.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationsScreen> {
  List<dynamic> notifications = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/notifications.json');
    final data = await json.decode(response);

    setState(() {
      notifications = data['notifications']
          .map((data) => InstagramNotification.fromJson(data))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(width: MediaQuery.of(context).size.width *0.6,
            image: AssetImage('assets/images/no_notifications.png'),
          ),
        ],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return NotificationItem(notification: notifications[index]);

              // return Slidable(
              //   actionPane: SlidableDrawerActionPane(),
              //   actionExtentRatio: 0.25,
              //   child: notificationItem(notifications[index]),
              //   secondaryActions: <Widget>[
              //     Container(
              //       height: 50,
              //       color: Colors.grey.shade500,
              //       child: const Icon(
              //         Icons.info_outline,
              //         color: Colors.white,
              //       ),
              //     ),
              //     Container(
              //         height: 50,
              //         color: Colors.red,
              //         child: const Icon(
              //           Icons.delete_outline_sharp,
              //           color: Colors.white,
              //         )),
              //   ],
              // );
            },
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final InstagramNotification notification;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              ProfilePic(
                  picUrl: notification.profilePic, radius: 32, name: ''),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: RichText(
                    softWrap: true,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: notification.content,
                            style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(
                          text: ' ${notification.timeAgo}',
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: 1),
      ],
    );
  }
}
