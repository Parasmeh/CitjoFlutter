import 'package:flutter/material.dart';

class TopNavOptionCategory extends StatelessWidget {
  final String title;

  const TopNavOptionCategory({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: 'Open Sans',
          ),
        ),
      ),
    );
  }
}
