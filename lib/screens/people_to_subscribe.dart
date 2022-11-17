import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';

class PeopleToSubscribeScreen extends StatefulWidget {
  const PeopleToSubscribeScreen({Key? key}) : super(key: key);

  @override
  PeopleToSubscribeScreenState createState() => PeopleToSubscribeScreenState();
}

class PeopleToSubscribeScreenState extends State<PeopleToSubscribeScreen> {
  List<dynamic> peopleToSubscribe = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: peopleToSubscribe.length,
            itemBuilder: (context, index) {
              return peopleToSubscribeItem();
            }));
  }

  peopleToSubscribeItem() {
    return Material(
      elevation: 10,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1)),
                          child: ClipRRect(
                              //borderRadius: BorderRadius.circular(52),
                              child: Image.network(
                                  "https://images.unsplash.com/photo-1498529605908-f357a9af7bf5?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=047fade70e80ebb22ac8f09c04872c40")),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: RichText(
                  text: const TextSpan(children: [
                TextSpan(text: "hello", style: TextStyle(color: Colors.black)),
              ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                height: 32,
                minWidth: 50,
                color: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {},
                child: Text(
                  'Subscribe',
                  style: Theme.of(context).textTheme.headlineLarge?.merge(
                        const TextStyle(color: AppColors.white),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
