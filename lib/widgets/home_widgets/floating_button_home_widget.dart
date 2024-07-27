import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/task_controllers.dart';
import '../../controller/textfield_controllers.dart';

class MyFloatingActionButtonHome extends StatelessWidget {
  final Color fabColor;
  const MyFloatingActionButtonHome({
    super.key, required this.fabColor,
  });

  @override
  Widget build(BuildContext context) {
    return FabCircularMenuPlus(
        fabMargin: const EdgeInsets.all(20),
        fabColor: fabColor,
        ringColor: Colors.grey[200],
        ringWidth: 70.0,
        ringDiameter: 420.0,
        fabCloseIcon: const Icon(
          Icons.clear_rounded,
          color: Colors.white,
        ),
        fabOpenIcon: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
        children: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.work_outline_rounded,
                size: 32.0,
                color: KYellowColor,
              ),
              splashColor: Colors.black87,
              splashRadius: 20.0,
              onPressed: () {
                Get.find<WorkTaskControllers>().isediting.value = false;
                Get.find<TextFieldControllers>().title!.text = '';
                Get.find<TextFieldControllers>().subtitle!.text = '';
                Get.toNamed('/workadd');
              }),
          IconButton(
              icon: const Icon(
                Icons.headset_outlined,
                size: 32.0,
                color: KOrangeColor,
              ),
              splashColor: Colors.black87,
              splashRadius: 20.0,
              onPressed: () {
                Get.find<MusicTaskControllers>().isediting.value = false;
                Get.find<TextFieldControllers>().title!.text = '';
                Get.find<TextFieldControllers>().subtitle!.text = '';
                Get.toNamed('/musicadd');
              }),
          IconButton(
              icon: const Icon(
                Icons.movie_creation_outlined,
                size: 32.0,
                color: KGreenColor,
              ),
              splashColor: Colors.black87,
              splashRadius: 20.0,
              onPressed: () {
                Get.find<MovieTaskControllers>().isediting.value = false;
                Get.find<TextFieldControllers>().title!.text = '';
                Get.find<TextFieldControllers>().subtitle!.text = '';
                Get.toNamed('/movieadd');
              }),
          IconButton(
              icon: const Icon(
                Icons.note_alt_outlined,
                size: 32.0,
                color: KPurpleColor,
              ),
              splashColor: Colors.black87,
              splashRadius: 20.0,
              onPressed: () {
                Get.find<StudyTaskControllers>().isediting.value = false;
                Get.find<TextFieldControllers>().title!.text = '';
                Get.find<TextFieldControllers>().subtitle!.text = '';
                Get.toNamed('/studyadd');
              }),
          IconButton(
              icon: const Icon(
                Icons.home_outlined,
                size: 32.0,
                color: KRedColor,
              ),
              splashColor: Colors.black87,
              splashRadius: 20.0,
              onPressed: () {
                Get.find<HomeTaskControllers>().isediting.value = false;
                Get.find<TextFieldControllers>().title!.text = '';
                Get.find<TextFieldControllers>().subtitle!.text = '';
                Get.toNamed('/homeadd');
              }),
          IconButton(
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 32.0,
                color: KPhiroozeColor,
              ),
              splashColor: Colors.black87,
              splashRadius: 20.0,
              onPressed: () {
                Get.find<ShopTaskControllers>().isediting.value = false;
                Get.find<TextFieldControllers>().title!.text = '';
                Get.find<TextFieldControllers>().subtitle!.text = '';
                Get.toNamed('/shopadd');
              }),
          IconButton(
              icon: const Icon(
                Icons.color_lens_outlined,
                size: 32.0,
                color: KLightPurpleColor,
              ),
              splashColor: Colors.black87,
              splashRadius: 20.0,
              onPressed: () {
                Get.find<ArtTaskControllers>().isediting.value = false;
                Get.find<TextFieldControllers>().title!.text = '';
                Get.find<TextFieldControllers>().subtitle!.text = '';
                Get.toNamed('/artadd');
              }),
          IconButton(
              icon: const Icon(
                Icons.travel_explore,
                size: 32.0,
                color: KTealColor,
              ),
              splashColor: Colors.black87,
              splashRadius: 20.0,
              onPressed: () {
                Get.find<TravelTaskControllers>().isediting.value = false;
                Get.find<TextFieldControllers>().title!.text = '';
                Get.find<TextFieldControllers>().subtitle!.text = '';
                Get.toNamed('/traveladd');
              }),
          IconButton(
              icon: const Icon(
                Icons.sports_gymnastics_outlined,
                size: 32.0,
                color: KPinkColor,
              ),
              splashColor: Colors.black87,
              splashRadius: 20.0,
              onPressed: () {
                Get.find<GymTaskControllers>().isediting.value = false;
                Get.find<TextFieldControllers>().title!.text = '';
                Get.find<TextFieldControllers>().subtitle!.text = '';
                Get.toNamed('/gymadd');
              }),
        ]);
  }
}
