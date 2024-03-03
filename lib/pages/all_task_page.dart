// ignore_for_file: non_constant_identifier_names

import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';
import '../pages/home_page.dart';

import '../constant.dart';

class AllTasksPages extends StatelessWidget {
  const AllTasksPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KLightBlueColor,
      appBar: MyAppBar(),
      drawer: drawer(),
      floatingActionButton: const MyFloatingActionButton(),
      body: const SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            TextsAndAvatarInTopContainer(),
            WhiteContainer(),
          ],
        ),
      ),
    );
  }
}

class TextsAndAvatarInTopContainer extends StatelessWidget {
  const TextsAndAvatarInTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 40, left: 40),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            child: SizedBox(
              height: 45.0,
              width: 45.0,
              child: Lottie.asset(
                'assets/animations/list.json',
                repeat: false,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 30.0, left: 60.0),
          child: const Text(
            'All',
            style: TextStyle(
                fontSize: 23.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 55.0, top: 5.0),
          child: Obx(() => Text(
                ' ${Get.find<WorkTaskControllers>().task.length + Get.find<MusicTaskControllers>().task.length + Get.find<MovieTaskControllers>().task.length + Get.find<StudyTaskControllers>().task.length + Get.find<HomeTaskControllers>().task.length + Get.find<ShopTaskControllers>().task.length + Get.find<ArtTaskControllers>().task.length + Get.find<TravelTaskControllers>().task.length + Get.find<GymTaskControllers>().task.length} Tasks',
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              )),
        ),
      ],
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

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FabCircularMenuPlus(
        fabMargin: const EdgeInsets.all(20),
        fabColor: KLightBlueColor,
        ringColor: Colors.blue[100],
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

AppBar MyAppBar() {
  return AppBar(
    backgroundColor: KLightBlueColor,
    elevation: 0.0,
    leading: Builder(
      builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu_open_rounded),
          color: Colors.white,
          iconSize: 40.0,
        );
      },
    ),
    actions: [
      IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 27.0,
        ),
        splashColor: KLightBlueColor,
        splashRadius: 27.0,
      )
    ],
  );
}

ClipPath drawer() {
  return ClipPath(
    clipper: OvalRightBorderClipper(),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Container(
      padding: const EdgeInsets.only(left: 16.0, right: 40),
      decoration: const BoxDecoration(
        color: KLightBlueColor,
      ),
      width: 300,
      height: Get.height,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 90,
                width: 90,
                alignment: Alignment.center,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: Center(
                    child: Icon(
                      Icons.list_alt,
                      color: KLightBlueColor,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 5.0, left: 103.0),
                child: const Text(
                  'ALL',
                  style: TextStyle(
                      fontSize: 23.0,
                      color: KBlackColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              //
              //
              //
              //
              GestureDetector(
                onTap: () {
                  Get.offAllNamed('/HomePage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.apps_rounded,
                    size: 35.0,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Lists   ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.0)),
                ]),
              ),

              const Divider(),
              //
              //
              GestureDetector(
                onTap: () {
                  Get.toNamed('/AllTaskPage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.list_alt,
                    size: 35.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('All   ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  )
                ]),
              ),

              const Divider(),
              //
              //

              GestureDetector(
                onTap: () {
                  Get.toNamed('/workpage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.work_outline_rounded,
                    size: 35.0,
                    color: KYellowColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Work   ',
                      style: TextStyle(
                          color: KBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                ]),
              ),
              const Divider(),
              //
              //
              GestureDetector(
                onTap: () {
                  Get.toNamed('/musicpage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.headset_outlined,
                    size: 35.0,
                    color: KOrangeColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Music   ',
                      style: TextStyle(
                          color: KBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                ]),
              ),
              const Divider(),
              //
              //
              GestureDetector(
                onTap: () {
                  Get.toNamed('/moviepage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.movie_creation_outlined,
                    size: 35.0,
                    color: KGreenColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Movie   ',
                      style: TextStyle(
                          color: KBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                ]),
              ),
              const Divider(),
              //
              //
              GestureDetector(
                onTap: () {
                  Get.toNamed('/studypage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.note_alt_outlined,
                    size: 35.0,
                    color: KPurpleColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Study   ',
                      style: TextStyle(
                          color: KBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                ]),
              ),
              const Divider(),
              //
              //
              GestureDetector(
                onTap: () {
                  Get.toNamed('/hometaskpage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.home_outlined,
                    size: 35.0,
                    color: KRedColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Home   ',
                      style: TextStyle(
                          color: KBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                ]),
              ),
              const Divider(),
              //
              //
              GestureDetector(
                onTap: () {
                  Get.toNamed('/shoppage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 35.0,
                    color: KPhiroozeColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Shop   ',
                      style: TextStyle(
                          color: KBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                ]),
              ),
              const Divider(),
              //
              //
              GestureDetector(
                onTap: () {
                  Get.toNamed('/artpage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.color_lens_outlined,
                    size: 35.0,
                    color: KLightPurpleColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Art   ',
                      style: TextStyle(
                          color: KBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                ]),
              ),
              const Divider(),
              //
              //
              GestureDetector(
                onTap: () {
                  Get.toNamed('/travelpage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.travel_explore,
                    size: 35.0,
                    color: KTealColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Travel   ',
                      style: TextStyle(
                          color: KBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                ]),
              ),
              const Divider(),
              //
              //
              GestureDetector(
                onTap: () {
                  Get.toNamed('/gympage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.sports_gymnastics_outlined,
                    size: 35.0,
                    color: KPinkColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Gym   ',
                      style: TextStyle(
                          color: KBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                ]),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    ),
  );
}
