// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../constant.dart';
import '../../controller/task_controllers.dart';
import '../../controller/textfield_controllers.dart';
import '../pages/home_page.dart';

class pmusicPage extends StatelessWidget {
  const pmusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KOrangeColor,
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
              height: 50.0,
              width: 50.0,
              child: Lottie.asset(
                'assets/animations/music.json',
                // repeat: false,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 20.0, left: 49.0),
          child: const Text(
            'موزیک',
            style: TextStyle(
                fontSize: 23.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 47.0, top: 5.0),
          child: Obx(() => Text(
                ' ${Get.find<MusicTaskControllers>().task.length} Tasks',
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
                  itemCount: Get.find<MusicTaskControllers>().task.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 35.0, right: 20.0),
                          onLongPress: () {
                            Get.defaultDialog(
                              title:
                                  'حذف ${Get.find<MusicTaskControllers>().task[index].title}',
                              titleStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              middleText: 'آیا مطمئنی ؟',
                              textConfirm: 'بله',
                              textCancel: 'خیر',
                              onCancel: () {},
                              confirmTextColor: Colors.white,
                              cancelTextColor: KOrangeColor,
                              buttonColor: KOrangeColor,
                              onConfirm: () {
                                Get.find<MusicTaskControllers>()
                                    .task
                                    .removeAt(index);
                                Get.back();
                              },
                            );
                          },
                          title: Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Text(
                                Get.find<MusicTaskControllers>()
                                    .task[index]
                                    .title!,
                                textDirection: TextDirection.rtl),
                          ),
                          subtitle: Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Text(
                                Get.find<MusicTaskControllers>()
                                    .task[index]
                                    .subtitle!,
                                textDirection: TextDirection.rtl),
                          ),
                          onTap: () {
                            Get.find<MusicTaskControllers>().index = index;
                            Get.find<MusicTaskControllers>().isediting.value =
                                true;
                            Get.find<TextFieldControllers>().title!.text =
                                Get.find<MusicTaskControllers>()
                                    .task[index]
                                    .title!;
                            //
                            //
                            Get.find<TextFieldControllers>().subtitle!.text =
                                Get.find<MusicTaskControllers>()
                                    .task[index]
                                    .subtitle!;

                            Get.toNamed('/pmusicadd');
                          },
                          leading: Checkbox(
                            activeColor: KOrangeColor,
                            onChanged: (value) {
                              Get.find<MusicTaskControllers>()
                                      .task[index]
                                      .status =
                                  !Get.find<MusicTaskControllers>()
                                      .task[index]
                                      .status!;
                              Get.find<MusicTaskControllers>().task[index] =
                                  Get.find<MusicTaskControllers>().task[index];
                            },
                            value: Get.find<MusicTaskControllers>()
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
            backgroundColor: KOrangeColor,
            onPressed: () {
              Get.find<MusicTaskControllers>().isediting.value = false;
              Get.find<TextFieldControllers>().title!.text = '';
              Get.find<TextFieldControllers>().subtitle!.text = '';
              Get.toNamed('/pmusicadd');
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
    backgroundColor: KOrangeColor,
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
        splashColor: KOrangeColor,
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
        color: KOrangeColor,
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
                      Icons.headset_outlined,
                      color: KOrangeColor,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 5.0, left: 90.0),
                child: const Text(
                  'موزیک',
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
                  Get.offAllNamed('/pHomePage');
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
                  Text('لیست   ',
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
                  Get.toNamed('/pAllTaskPage');
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
                  Text('همه   ',
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
                  Get.toNamed('/pworkpage');
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
                  Text('کاری   ',
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
                  Get.toNamed('/pmusicpage');
                },
                child: const Row(children: [
                  Icon(
                    Icons.headset_outlined,
                    size: 35.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('موزیک   ',
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
                  Get.toNamed('/pmoviepage');
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
                  Text('فیلم   ',
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
                  Get.toNamed('/pstudypage');
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
                  Text('تکالیف   ',
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
                  Get.toNamed('/phometaskpage');
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
                  Text('منزل   ',
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
                  Text('خرید   ',
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
                  Text('هنر   ',
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
                  Text('تراول   ',
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
                  Text('باشگاه   ',
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
