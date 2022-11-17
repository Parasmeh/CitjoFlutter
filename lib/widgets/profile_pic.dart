import 'package:flutter/material.dart';

import '../services/get_it_service.dart';
import '../services/navigation_service.dart';

class ProfilePic extends StatelessWidget {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();
  final String picUrl;
  final String name;
  final double radius;

  ProfilePic({Key? key, required this.picUrl, required this.name, this.radius = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    // return Stack(
    //   children: <Widget>[
    //     CircleAvatar(
    //       radius: radius,
    //       backgroundImage: NetworkImage(
    //         picUrl,
    //       ),
    //       backgroundColor: Colors.transparent,
    //     ),
    //
    //     Positioned(
    //       bottom: 3.0,
    //       right: 3.0,
    //       child: InkWell(
    //           child: Icon(Icons.edit, color: Colors.black, size: 15.0,),
    //         onTap: (){
    //             print("pfpc");
    //         },
    //       ),
    //     ),
    //
    //   ],
    // );

    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(
        picUrl,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
