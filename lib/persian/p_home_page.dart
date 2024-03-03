// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../constant.dart';
import '../../controller/task_controllers.dart';
import '../../controller/textfield_controllers.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://t.me//mehdinoorzehi');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class pHomePage extends StatelessWidget {
  const pHomePage({super.key});

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
              Get.offAllNamed('/HomePage');
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
        'لیست',
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
            Get.toNamed('/pAllTaskPage');
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
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 12, top: 14.0),
                  child:
                      Lottie.asset('assets/animations/list.json', height: 45.0
                          // repeat: false
                          ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0, top: 3.0),
                  child: const Text(
                    'همه',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Obx(() => Text(
                        '${Get.find<WorkTaskControllers>().task.length + Get.find<MusicTaskControllers>().task.length + Get.find<MovieTaskControllers>().task.length + Get.find<StudyTaskControllers>().task.length + Get.find<HomeTaskControllers>().task.length + Get.find<ShopTaskControllers>().task.length + Get.find<ArtTaskControllers>().task.length + Get.find<TravelTaskControllers>().task.length + Get.find<GymTaskControllers>().task.length} کار ها',
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
        //
        GestureDetector(
          onTap: () {
            Get.toNamed('/pworkpage');
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
                  alignment: Alignment.topRight,
                  child:
                      Lottie.asset('assets/animations/work.json', height: 63.0
                          // repeat: false,
                          ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Text(
                    'کاری',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Obx(() => Text(
                        ' ${Get.find<WorkTaskControllers>().task.length} کار ها',
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
            Get.toNamed('/pmusicpage');
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
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 2),
                  child: Lottie.asset('assets/animations/music.json',
                      height: 63.0),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Text(
                    'موزیک',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Obx(() => Text(
                        ' ${Get.find<MusicTaskControllers>().task.length} کار ها',
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
            Get.toNamed('/pmoviepage');
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
                  alignment: Alignment.topRight,
                  child: Lottie.asset('assets/animations/movie.json',
                      height: 60.0),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Text(
                    'فیلم',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Obx(() => Text(
                        ' ${Get.find<MovieTaskControllers>().task.length} کار ها',
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
            Get.toNamed('/pstudypage');
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
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 12),
                  child: Lottie.asset('assets/animations/study.json',
                      height: 60.0),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Text(
                    'تکالیف',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Obx(() => Text(
                        ' ${Get.find<StudyTaskControllers>().task.length} کار ها',
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
            Get.toNamed('/phometaskpage');
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
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 12, top: 14.0),
                  child:
                      Lottie.asset('assets/animations/home.json', height: 43.0),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Text(
                    'منزل',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Obx(() => Text(
                        ' ${Get.find<HomeTaskControllers>().task.length} کار ها',
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
            Get.toNamed('/pshoppage');
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
                  alignment: Alignment.topRight,
                  child: Lottie.asset('assets/animations/shop2.json',
                      height: 70.0),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Text(
                    'خرید',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Obx(() => Text(
                        ' ${Get.find<ShopTaskControllers>().task.length} کار ها',
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
            Get.toNamed('/partpage');
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
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 7, top: 14.0),
                  child:
                      Lottie.asset('assets/animations/art.json', height: 53.0),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Text(
                    'هنر',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Obx(() => Text(
                        ' ${Get.find<ArtTaskControllers>().task.length} کار ها',
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
            Get.toNamed('/ptravelpage');
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
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 7),
                  child: Lottie.asset('assets/animations/travel.json',
                      height: 60.0),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Text(
                    'سفر',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Obx(() => Text(
                        ' ${Get.find<TravelTaskControllers>().task.length} کار ها',
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
            Get.toNamed('/pgympage');
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
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 12),
                  child:
                      Lottie.asset('assets/animations/gym.json', height: 66.0),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Text(
                    'باشگاه',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Obx(() => Text(
                        ' ${Get.find<GymTaskControllers>().task.length} کار ها',
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
      height: Get.height,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 110.0,
                width: 110.0,
                alignment: Alignment.center,
                child: Image.asset('assets/images/icon.png'),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 99.0),
                child: const Text(
                  'EASY\nTODO',
                  style: TextStyle(
                      fontSize: 19.0,
                      color: KBlackColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
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
              //
              //
              //
              Builder(builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  margin: const EdgeInsets.only(left: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      _launchUrl();
                    },
                    child: const Row(children: [
                      Icon(
                        Icons.telegram_outlined,
                        size: 23.0,
                        color: Color(0xff1288C3),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('developed by Mehdi Noorzehi            ',
                          style: TextStyle(color: KBlackColor, fontSize: 10.0)),
                    ]),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    ),
  );
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30.0),
      child: FabCircularMenuPlus(
          alignment: Alignment.bottomLeft,
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
          ]),
    );
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
