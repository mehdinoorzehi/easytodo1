// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../constant.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';
import '../pages/home_page.dart';

class moviePage extends StatelessWidget {
  const moviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KGreenColor,
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
            child: Container(
              margin: const EdgeInsets.only(left: 7.0),
              height: 50.0,
              width: 50.0,
              child: Lottie.asset(
                'assets/animations/movie.json',
                // repeat: false,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 30.0, left: 50.0),
          child: const Text(
            'Movie',
            style: TextStyle(
                fontSize: 23.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 50.0, top: 5.0),
          child: Obx(() => Text(
                ' ${Get.find<MovieTaskControllers>().task.length} Tasks',
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
              //
              child: Obx(
                () => ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 60.0, right: 60.0),
                      child: const Divider(
                        color: Colors.black54,
                      ),
                    );
                  },
                  controller: scrollController,
                  itemCount: Get.find<MovieTaskControllers>().task.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 35.0, right: 20.0),
                          onLongPress: () {
                            Get.defaultDialog(
                              title:
                                  'Delete ${Get.find<MovieTaskControllers>().task[index].title}',
                              middleText: 'Are you sure ?',
                              onCancel: () {},
                              confirmTextColor: Colors.white,
                              cancelTextColor: KGreenColor,
                              buttonColor: KGreenColor,
                              onConfirm: () {
                                Get.find<MovieTaskControllers>()
                                    .task
                                    .removeAt(index);
                                Get.back();
                              },
                            );
                          },
                          title: Text(Get.find<MovieTaskControllers>()
                              .task[index]
                              .title!),
                          subtitle: Text(Get.find<MovieTaskControllers>()
                              .task[index]
                              .subtitle!),
                          onTap: () {
                            Get.find<MovieTaskControllers>().index = index;
                            Get.find<MovieTaskControllers>().isediting.value =
                                true;
                            Get.find<TextFieldControllers>().title!.text =
                                Get.find<MovieTaskControllers>()
                                    .task[index]
                                    .title!;
                            //
                            //
                            Get.find<TextFieldControllers>().subtitle!.text =
                                Get.find<MovieTaskControllers>()
                                    .task[index]
                                    .subtitle!;

                            Get.toNamed('/movieadd');
                          },
                          trailing: Checkbox(
                            activeColor: KGreenColor,
                            onChanged: (value) {
                              Get.find<MovieTaskControllers>()
                                      .task[index]
                                      .status =
                                  !Get.find<MovieTaskControllers>()
                                      .task[index]
                                      .status!;
                              Get.find<MovieTaskControllers>().task[index] =
                                  Get.find<MovieTaskControllers>().task[index];
                            },
                            value: Get.find<MovieTaskControllers>()
                                .task[index]
                                .status,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0))),
                          ),
                        ));
                  },
                ),
              ));
        });
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: 67.0,
        height: 67.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: KGreenColor,
            onPressed: () {
              Get.find<MovieTaskControllers>().isediting.value = false;
              Get.find<TextFieldControllers>().title!.text = '';
              Get.find<TextFieldControllers>().subtitle!.text = '';
              Get.toNamed('/movieadd');
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

AppBar MyAppBar() {
  return AppBar(
    backgroundColor: KGreenColor,
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
        splashColor: KGreenColor,
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
        color: KGreenColor,
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
                      Icons.movie_creation_outlined,
                      color: KGreenColor,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 5.0, left: 85.0),
                child: const Text(
                  'MOVIE',
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
                    color: KLightBlueColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('All   ',
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
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Movie   ',
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
