// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';

import '../widgets/other_widgets/floating_action_button_widget.dart';
import '../widgets/other_widgets/text_avatar_in_top_container_widget.dart';

class gymPage extends StatelessWidget {
  const gymPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPinkColor,
      floatingActionButton: MyFloatingActionButton(
        backGroundColor: KPinkColor,
        onTap: () {
          Get.find<GymTaskControllers>().isediting.value = false;
          Get.find<TextFieldControllers>().title!.text = '';
          Get.find<TextFieldControllers>().subtitle!.text = '';
          Get.toNamed('/gymadd');
        },
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(() => TextsAndAvatarInTopContainer(
                marginLeft: 10,
                imageAddress: 'assets/animations/gym.json',
                title: 'Gym',
                subTitle:
                    ' ${Get.find<GymTaskControllers>().task.length} Tasks')),
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
                  itemCount: gymController.task.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 35.0, right: 20.0),
                          onLongPress: () {
                            Get.defaultDialog(
                              title:
                                  'Delete ${gymController.task[index].title}',
                              middleText: 'Are you sure ?',
                              onCancel: () {},
                              confirmTextColor: Colors.white,
                              cancelTextColor: KPinkColor,
                              buttonColor: KPinkColor,
                              onConfirm: () {
                                gymController.task.removeAt(index);
                                Get.back();
                              },
                            );
                          },
                          title: Text(gymController.task[index].title!),
                          subtitle: Text(gymController.task[index].subtitle!),
                          onTap: () {
                            gymController.index = index;
                            gymController.isediting.value = true;
                            textController.title!.text =
                                gymController.task[index].title!;
                            //
                            //
                            textController.subtitle!.text =
                                gymController.task[index].subtitle!;

                            Get.toNamed('/gymadd');
                          },
                          trailing: Checkbox(
                            activeColor: KPinkColor,
                            onChanged: (value) {
                              gymController.task[index].status =
                                  !gymController.task[index].status!;
                              gymController.task[index] =
                                  gymController.task[index];
                            },
                            value: gymController.task[index].status,
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
