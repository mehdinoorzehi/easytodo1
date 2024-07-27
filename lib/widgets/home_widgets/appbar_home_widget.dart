import 'package:flutter/material.dart';

import '../../constant.dart';

// ignore: non_constant_identifier_names
AppBar MyAppBarHome() {
  return AppBar(
    surfaceTintColor: KwhiteColor,
    actions: [
      Container(
        margin: const EdgeInsets.only(right: 5.0),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.language_rounded,
            color: KBlackColor,
            size: 32.0,
          ),
          splashRadius: 25.0,
        ),
      )
    ],
    centerTitle: true,
    title: const Text(
      'Lists',
      style: TextStyle(
          fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    backgroundColor: const Color(0xfff5f5f5),
    elevation: 0.0,
    leading: Builder(
      builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu_open_rounded),
          color: Colors.black,
          iconSize: 40.0,
        );
      },
    ),
  );
}
