import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'appbar_widget.dart';

class TextsAndAvatarInTopContainer extends StatelessWidget {
  final String imageAddress;
  final String title;
  final String subTitle;
  final double marginLeft;
  const TextsAndAvatarInTopContainer({
    super.key,
    required this.imageAddress,
    required this.title,
    required this.subTitle,
    this.marginLeft = 7,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
      ),
      child: Column(
        children: [
          const MyAppBarWidget(),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35,
              child: SizedBox(
                height: 45.0,
                width: 45.0,
                child: Lottie.asset(
                  imageAddress,
                  repeat: true,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: marginLeft, top: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 23.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 7, top: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              subTitle,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
