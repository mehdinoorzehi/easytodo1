// ignore_for_file: non_constant_identifier_names

import 'package:easytodo1/widgets/home_widgets/floating_button_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controllers.dart';

import '../constant.dart';
import '../widgets/other_widgets/text_avatar_in_top_container_widget.dart';

class AllTasksPages extends StatelessWidget {
  const AllTasksPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KLightBlueColor,
      floatingActionButton: const MyFloatingActionButtonHome(
        fabColor: KLightBlueColor,
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(() => TextsAndAvatarInTopContainer(
                  marginLeft: 20,
                  imageAddress: 'assets/animations/list.json',
                  title: 'All',
                  subTitle:
                      ' ${Get.find<WorkTaskControllers>().task.length + Get.find<MusicTaskControllers>().task.length + Get.find<MovieTaskControllers>().task.length + Get.find<StudyTaskControllers>().task.length + Get.find<HomeTaskControllers>().task.length + Get.find<ShopTaskControllers>().task.length + Get.find<ArtTaskControllers>().task.length + Get.find<TravelTaskControllers>().task.length + Get.find<GymTaskControllers>().task.length} Tasks',
                )),
            const WhiteContainer(),
          ],
        ),
      ),
    );
  }
}

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.66,
      minChildSize: 0.66,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
              color: Colors.white),
          child: ListView.builder(
            controller: scrollController,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/workpage'),
                        leading: const Icon(
                          Icons.work_outline_rounded,
                          size: 32.0,
                          color: KYellowColor,
                        ),
                        title: Text(
                          '${Get.find<WorkTaskControllers>().task.length} Work Tasks',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/musicpage'),
                        leading: const Icon(
                          Icons.headset_outlined,
                          size: 32.0,
                          color: KOrangeColor,
                        ),
                        title: Text(
                          '${Get.find<MusicTaskControllers>().task.length} Music Tasks',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/moviepage'),
                        leading: const Icon(
                          Icons.movie_creation_outlined,
                          size: 32.0,
                          color: KGreenColor,
                        ),
                        title: Text(
                          '${Get.find<MovieTaskControllers>().task.length} Movie Tasks',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/studypage'),
                        leading: const Icon(
                          Icons.note_alt_outlined,
                          size: 32.0,
                          color: KPurpleColor,
                        ),
                        title: Text(
                          '${Get.find<StudyTaskControllers>().task.length} Study Tasks',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/hometaskpage'),
                        leading: const Icon(
                          Icons.home_outlined,
                          size: 32.0,
                          color: KRedColor,
                        ),
                        title: Text(
                          '${Get.find<HomeTaskControllers>().task.length} Home Tasks',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/shoppage'),
                        leading: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 32.0,
                          color: KPhiroozeColor,
                        ),
                        title: Text(
                          '${Get.find<ShopTaskControllers>().task.length} Shop Tasks',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/artpage'),
                        leading: const Icon(
                          Icons.color_lens_outlined,
                          size: 32.0,
                          color: KLightPurpleColor,
                        ),
                        title: Text(
                          '${Get.find<ArtTaskControllers>().task.length} Art Tasks',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/travelpage'),
                        leading: const Icon(
                          Icons.travel_explore,
                          size: 32.0,
                          color: KTealColor,
                        ),
                        title: Text(
                          '${Get.find<TravelTaskControllers>().task.length} Travel Tasks',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/gympage'),
                        leading: const Icon(
                          Icons.sports_gymnastics_outlined,
                          size: 32.0,
                          color: KPinkColor,
                        ),
                        title: Text(
                          '${Get.find<GymTaskControllers>().task.length} Gym Tasks',
                        ),
                      )),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
