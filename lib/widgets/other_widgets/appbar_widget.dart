import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../constant.dart';

class MyAppBarWidget extends StatelessWidget {
  const MyAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 27.0,
            color: Colors.black,
          ),
          splashColor: KLightBlueColor,
          splashRadius: 27.0,
        ),
      ),
    );
  }
}
