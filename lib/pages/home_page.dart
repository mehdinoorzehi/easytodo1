//ignore_for_file:  --no-tree-shake-icons, prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../constant.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

//
//
//

final Uri _url = Uri.parse('https://t.me//mehdinoorzehi');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: MyAppBar(),
      drawer: drawer(),
      floatingActionButton: const MyFloatingActionButton(),
      body: MyGridView(),
    );
  }

  AppBar MyAppBar() {
    return AppBar(
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          child: IconButton(
            onPressed: () {
              Get.offAllNamed('/pHomePage');
            },
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

  ClipPath drawer() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: const BoxDecoration(
          color: Color(0xfff5f5f5),
        ),
        width: 300,
        height: 2000,
        child: ListWheelScrollView.useDelegate(
          itemExtent: 80,
          diameterRatio: 1.7,
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) {
              return ListTile(
                leading: Icon(
                  icons[index],
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  titles[index],
                  style: boldTextStyle(color: Colors.black),
                ),
                onTap: () {
                  // Navigator.of(context).pop();
                  actions[index](context);
                },
              );
            },
            childCount: icons.length,
          ),
        ),
      ),
    );
  }

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
        GestureDetector(
          onTap: () {
            Get.toNamed('/AllTaskPage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 45.0,
                  width: 45.0,
                  margin: const EdgeInsets.only(left: 8.0, top: 17.0),
                  child: Lottie.asset(
                    'assets/animations/list.json',
                    // repeat: false
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0, left: 15.0),
                  child: const Text(
                    'All',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.0, top: 10.0),
                  child: Obx(() => Text(
                        ' ${Get.find<WorkTaskControllers>().task.length + Get.find<MusicTaskControllers>().task.length + Get.find<MovieTaskControllers>().task.length + Get.find<StudyTaskControllers>().task.length + Get.find<HomeTaskControllers>().task.length + Get.find<ShopTaskControllers>().task.length + Get.find<ArtTaskControllers>().task.length + Get.find<TravelTaskControllers>().task.length + Get.find<GymTaskControllers>().task.length} Tasks',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //
        //
        //
        GestureDetector(
          onTap: () {
            Get.toNamed('/workpage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 63.0,
                  height: 63.0,
                  margin: const EdgeInsets.only(left: 10.0, top: 12.0),
                  child: Lottie.asset(
                    'assets/animations/work.json',
                    // repeat: false,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0, left: 25.0),
                  child: const Text(
                    'Work',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25.0, top: 9.0),
                  child: Obx(() => Text(
                        ' ${Get.find<WorkTaskControllers>().task.length} Tasks',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //
        //
        //
        GestureDetector(
          onTap: () {
            Get.toNamed('/musicpage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 63.0,
                  height: 63.0,
                  margin: const EdgeInsets.only(left: 8.0, top: 5.0),
                  child: Lottie.asset('assets/animations/music.json'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0, left: 20.0),
                  child: const Text(
                    'Music',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Obx(() => Text(
                        ' ${Get.find<MusicTaskControllers>().task.length} Tasks',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //
        //
        //
        GestureDetector(
          onTap: () {
            Get.toNamed('/moviepage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  margin: const EdgeInsets.only(left: 8.0, top: 5.0),
                  child: Lottie.asset('assets/animations/movie.json'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0, left: 20.0),
                  child: const Text(
                    'Movie',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Obx(() => Text(
                        ' ${Get.find<MovieTaskControllers>().task.length} Tasks',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //
        //
        //
        GestureDetector(
          onTap: () {
            Get.toNamed('/studypage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  margin: const EdgeInsets.only(left: 8.0, top: 5.0),
                  child: Lottie.asset('assets/animations/study.json'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0, left: 20.0),
                  child: const Text(
                    'Study',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Obx(() => Text(
                        ' ${Get.find<StudyTaskControllers>().task.length} Tasks',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //
        //
        //
        GestureDetector(
          onTap: () {
            Get.toNamed('/hometaskpage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 43.0,
                  width: 43.0,
                  margin: const EdgeInsets.only(left: 12.0, top: 19.0),
                  child: Lottie.asset('assets/animations/home.json'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0, left: 20.0),
                  child: const Text(
                    'Home',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Obx(() => Text(
                        ' ${Get.find<HomeTaskControllers>().task.length} Tasks',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //
        //
        //
        GestureDetector(
          onTap: () {
            Get.toNamed('/shoppage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70.0,
                  width: 70.0,
                  child: Lottie.asset('assets/animations/shop2.json'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 21.0, left: 20.0),
                  child: const Text(
                    'Shop',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Obx(() => Text(
                        ' ${Get.find<ShopTaskControllers>().task.length} Tasks',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //
        //
        //
        GestureDetector(
          onTap: () {
            Get.toNamed('/artpage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 53.0,
                  width: 53.0,
                  margin: const EdgeInsets.only(left: 12.0, top: 15.0),
                  child: Lottie.asset('assets/animations/art.json'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0, left: 25.0),
                  child: const Text(
                    'Art',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25.0, top: 10.0),
                  child: Obx(() => Text(
                        ' ${Get.find<ArtTaskControllers>().task.length} Tasks',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //
        //
        //
        GestureDetector(
          onTap: () {
            Get.toNamed('/travelpage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  margin: const EdgeInsets.only(left: 5.0, top: 3.0),
                  child: Lottie.asset('assets/animations/travel.json'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0, left: 20.0),
                  child: const Text(
                    'Travel',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Obx(() => Text(
                        ' ${Get.find<TravelTaskControllers>().task.length} Tasks',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //
        //
        //
        GestureDetector(
          onTap: () {
            Get.toNamed('/gympage');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 66.0,
                  width: 66.0,
                  margin: const EdgeInsets.only(left: 12.0),
                  child: Lottie.asset('assets/animations/gym.json'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 21.0, left: 25.0),
                  child: const Text(
                    'Gym',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25.0, top: 10.0),
                  child: Obx(() => Text(
                        ' ${Get.find<GymTaskControllers>().task.length} Tasks',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //
        //
        //
      ],
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
        fabColor: KBlackColor,
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

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

final titles = [
  'EASY TODO',
  'Calendar',
  'Pomodoro',
  'Change Theme',
  'Change Language',
  'Contact us',
  'Tasks ⤵',
  'All',
  'Important',
  'Today',
  'Tomorrow',
  'Past History',
  'Done',
  'Undone',
];
final icons = [
  Icons.check_circle_rounded,
  Icons.calendar_month_outlined,
  Icons.access_time_outlined,
  Icons.brightness_4_outlined,
  Icons.language,
  Icons.assignment_ind_outlined,
  Icons.task_outlined,
  Icons.list_alt_outlined,
  Icons.star_border_outlined,
  Icons.today_outlined,
  Icons.edit_calendar_rounded,
  Icons.event_repeat_outlined,
  Icons.done_all_rounded,
  Icons.clear_rounded,
];
final actions = [
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
];
