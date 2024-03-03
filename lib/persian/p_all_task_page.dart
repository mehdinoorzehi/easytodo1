// ignore_for_file: non_constant_identifier_names

import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../constant.dart';
import '../../controller/task_controllers.dart';
import '../../controller/textfield_controllers.dart';
import '../pages/home_page.dart';

// ignore: camel_case_types
class pAllTasksPages extends StatelessWidget {
  const pAllTasksPages({super.key});

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
          margin: const EdgeInsets.only(top: 20.0, left: 60.0),
          child: const Text(
            'همه',
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
                        onTap: () => Get.toNamed('/pworkpage'),
                        leading: const Icon(
                          Icons.work_outline_rounded,
                          size: 32.0,
                          color: KYellowColor,
                        ),
                        title: Text(
                          '${Get.find<WorkTaskControllers>().task.length}  تسک های کاری',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/pmusicpage'),
                        leading: const Icon(
                          Icons.headset_outlined,
                          size: 32.0,
                          color: KOrangeColor,
                        ),
                        title: Text(
                          '${Get.find<MusicTaskControllers>().task.length}  تسک های موزیک',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/pmoviepage'),
                        leading: const Icon(
                          Icons.movie_creation_outlined,
                          size: 32.0,
                          color: KGreenColor,
                        ),
                        title: Text(
                          '${Get.find<MovieTaskControllers>().task.length}  تسک های فیلم',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/pstudypage'),
                        leading: const Icon(
                          Icons.note_alt_outlined,
                          size: 32.0,
                          color: KPurpleColor,
                        ),
                        title: Text(
                          '${Get.find<StudyTaskControllers>().task.length}  تسک های تکالیف',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/phometaskpage'),
                        leading: const Icon(
                          Icons.home_outlined,
                          size: 32.0,
                          color: KRedColor,
                        ),
                        title: Text(
                          '${Get.find<HomeTaskControllers>().task.length}  تسک های منزل',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/pshoppage'),
                        leading: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 32.0,
                          color: KPhiroozeColor,
                        ),
                        title: Text(
                          '${Get.find<ShopTaskControllers>().task.length}  تسک های خرید',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/partpage'),
                        leading: const Icon(
                          Icons.color_lens_outlined,
                          size: 32.0,
                          color: KLightPurpleColor,
                        ),
                        title: Text(
                          '${Get.find<ArtTaskControllers>().task.length}  تسک های هنر ',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/ptravelpage'),
                        leading: const Icon(
                          Icons.travel_explore,
                          size: 32.0,
                          color: KTealColor,
                        ),
                        title: Text(
                          '${Get.find<TravelTaskControllers>().task.length}  تسک های سفر',
                        ),
                      )),
                  Obx(() => ListTile(
                        contentPadding: const EdgeInsets.only(left: 30.0),
                        onTap: () => Get.toNamed('/pgympage'),
                        leading: const Icon(
                          Icons.sports_gymnastics_outlined,
                          size: 32.0,
                          color: KPinkColor,
                        ),
                        title: Text(
                          '${Get.find<GymTaskControllers>().task.length}  تسک های باشگاه',
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
                Get.toNamed('/pworkadd');
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
                Get.toNamed('/pmusicadd');
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
                Get.toNamed('/pmovieadd');
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
                Get.toNamed('/pstudyadd');
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
                Get.toNamed('/phomeadd');
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
                Get.toNamed('/pshopadd');
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
                Get.toNamed('/partadd');
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
                Get.toNamed('/ptraveladd');
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
                Get.toNamed('/pgymadd');
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
                margin: const EdgeInsets.only(top: 5.0, left: 110.0),
                child: const Text(
                  'همه',
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
                  Text('لیست                                    ',
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
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('همه   ',
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
                    color: KOrangeColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('موزیک   ',
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
                  Text('تکالیف                                            ',
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
                  Get.toNamed('/pshoppage');
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
                  Get.toNamed('/partpage');
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
                  Get.toNamed('/ptravelpage');
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
                  Text('سفر   ',
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
                  Get.toNamed('/pgympage');
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
