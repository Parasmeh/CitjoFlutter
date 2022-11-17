import 'package:flutter/material.dart';

import 'skelton.dart';

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Skeleton(height: 120, width: 120),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(width: 80),
                const SizedBox(height: 16 / 2),
                Skeleton(),
                const SizedBox(height: 16 / 2),
                Skeleton(),
                const SizedBox(height: 16 / 2),
                Row(
                  children: [
                    Expanded(
                      child: Skeleton(),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Skeleton(),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
