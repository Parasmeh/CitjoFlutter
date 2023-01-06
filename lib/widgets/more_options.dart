import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../stores/userStore.dart';

class MoreOptionSection extends StatelessWidget {
  const MoreOptionSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 112,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 0.6,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000.0),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Icon(
                        Icons.share_outlined,
                        size: 24.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 0.6,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000.0),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Icon(
                        Icons.repeat,
                        size: 24.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Repost',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 0.6,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000.0),
                    onTap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return const MoreOptionSection();
                        },
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Icon(
                        Icons.flag_outlined,
                        size: 24.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Report',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 0.6,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000.0),
                    // onTap: () {
                    //   Provider.of<UserStore>(context, listen: false)
                    //       .deletePost(postId);
                    // },
                    child: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Icon(
                        Icons.delete_outline_rounded,
                        size: 24.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
