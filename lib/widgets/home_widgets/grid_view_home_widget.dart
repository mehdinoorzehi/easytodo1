  import 'package:easytodo1/widgets/home_widgets/container_grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/task_controllers.dart';

// ignore: non_constant_identifier_names
GridView MyGridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: [
        //
        //
        //
        Obx(
          () => ContainerGridViewWidget(
            onTap: () {
              Get.toNamed('/AllTaskPage');
            },
            animationAddress: 'assets/animations/list.json',
            title: 'All',
            subtitle:
                ' ${Get.find<WorkTaskControllers>().task.length + Get.find<MusicTaskControllers>().task.length + Get.find<MovieTaskControllers>().task.length + Get.find<StudyTaskControllers>().task.length + Get.find<HomeTaskControllers>().task.length + Get.find<ShopTaskControllers>().task.length + Get.find<ArtTaskControllers>().task.length + Get.find<TravelTaskControllers>().task.length + Get.find<GymTaskControllers>().task.length} Tasks',
          ),
        ),
        //
        //
        //
        Obx(
          () => ContainerGridViewWidget(
            onTap: () {
              Get.toNamed('/workpage');
            },
            animationAddress: 'assets/animations/work.json',
            title: 'Work',
            subtitle: ' ${Get.find<WorkTaskControllers>().task.length} Tasks',
          ),
        ),
        //
        //
        //
        Obx(
          () => ContainerGridViewWidget(
            onTap: () {
              Get.toNamed('/musicpage');
            },
            animationAddress: 'assets/animations/music.json',
            title: 'Music',
            subtitle: ' ${Get.find<MusicTaskControllers>().task.length} Tasks',
          ),
        ),
        //
        //
        //
        Obx(
          () => ContainerGridViewWidget(
            onTap: () {
              Get.toNamed('/moviepage');
            },
            animationAddress: 'assets/animations/movie.json',
            title: 'Movie',
            subtitle: ' ${Get.find<MovieTaskControllers>().task.length} Tasks',
          ),
        ),
        //
        //
        //
        Obx(
          () => ContainerGridViewWidget(
            onTap: () {
              Get.toNamed('/studypage');
            },
            animationAddress: 'assets/animations/study.json',
            title: 'Study',
            subtitle: ' ${Get.find<StudyTaskControllers>().task.length} Tasks',
          ),
        ),
        //
        //
        //
        Obx(
          () => ContainerGridViewWidget(
            onTap: () {
              Get.toNamed('/hometaskpage');
            },
            animationAddress: 'assets/animations/home.json',
            title: 'Home',
            subtitle: ' ${Get.find<HomeTaskControllers>().task.length} Tasks',
          ),
        ),
        //
        //
        //
        Obx(
          () => ContainerGridViewWidget(
            onTap: () {
              Get.toNamed('/shoppage');
            },
            animationAddress: 'assets/animations/shop2.json',
            title: 'Shop',
            subtitle: ' ${Get.find<ShopTaskControllers>().task.length} Tasks',
          ),
        ),
        //
        //
        //
        Obx(
          () => ContainerGridViewWidget(
            onTap: () {
              Get.toNamed('/artpage');
            },
            animationAddress: 'assets/animations/art.json',
            title: 'Art',
            subtitle: ' ${Get.find<ArtTaskControllers>().task.length} Tasks',
          ),
        ),
        //
        //
        //
        Obx(
          () => ContainerGridViewWidget(
            onTap: () {
              Get.toNamed('/travelpage');
            },
            animationAddress: 'assets/animations/travel.json',
            title: 'Travel',
            subtitle: ' ${Get.find<TravelTaskControllers>().task.length} Tasks',
          ),
        ),
        //
        //
        //
        Obx(
          () => ContainerGridViewWidget(
            onTap: () {
              Get.toNamed('/gympage');
            },
            animationAddress: 'assets/animations/gym.json',
            title: 'Gym',
            subtitle: ' ${Get.find<GymTaskControllers>().task.length} Tasks',
          ),
        ),
      ],
    );
  }