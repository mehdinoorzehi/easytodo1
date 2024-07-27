// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';

import '../widgets/other_widgets/floating_action_button_widget.dart';
import '../widgets/other_widgets/text_avatar_in_top_container_widget.dart';

class homeTaskPage extends StatelessWidget {
  const homeTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KRedColor,
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          Get.find<HomeTaskControllers>().isediting.value = false;
          Get.find<TextFieldControllers>().title!.text = '';
          Get.find<TextFieldControllers>().subtitle!.text = '';
          Get.toNamed('/homeadd');
        },
        backGroundColor: KRedColor,
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(() => TextsAndAvatarInTopContainer(
                imageAddress: 'assets/animations/home.json',
                title: 'Home',
                subTitle:
                    ' ${Get.find<HomeTaskControllers>().task.length} Tasks')),
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
                  itemCount: homeController.task.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 35.0, right: 20.0),
                          onLongPress: () {
                            Get.defaultDialog(
                              title:
                                  'Delete ${homeController.task[index].title}',
                              middleText: 'Are you sure ?',
                              onCancel: () {},
                              confirmTextColor: Colors.white,
                              cancelTextColor: KRedColor,
                              buttonColor: KRedColor,
                              onConfirm: () {
                                homeController.task.removeAt(index);
                                Get.back();
                              },
                            );
                          },
                          title: Text(homeController.task[index].title!),
                          subtitle: Text(homeController.task[index].subtitle!),
                          onTap: () {
                            homeController.index = index;
                            homeController.isediting.value = true;
                            textController.title!.text =
                                homeController.task[index].title!;
                            //
                            //
                            textController.subtitle!.text =
                                homeController.task[index].subtitle!;

                            Get.toNamed('/homeadd');
                          },
                          trailing: Checkbox(
                            activeColor: KRedColor,
                            onChanged: (value) {
                              homeController.task[index].status =
                                  !homeController.task[index].status!;
                              homeController.task[index] =
                                  homeController.task[index];
                            },
                            value: homeController.task[index].status,
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
