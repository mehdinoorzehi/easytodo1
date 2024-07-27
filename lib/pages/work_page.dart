// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';

import '../widgets/other_widgets/floating_action_button_widget.dart';
import '../widgets/other_widgets/text_avatar_in_top_container_widget.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KYellowColor,
      floatingActionButton: MyFloatingActionButton(
        backGroundColor: KYellowColor,
        onTap: () {
          Get.find<WorkTaskControllers>().isediting.value = false;
          Get.find<TextFieldControllers>().title!.text = '';
          Get.find<TextFieldControllers>().subtitle!.text = '';
          Get.toNamed('/workadd');
        },
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(() => TextsAndAvatarInTopContainer(
                imageAddress: 'assets/animations/work.json',
                title: 'Work',
                subTitle:
                    ' ${Get.find<WorkTaskControllers>().task.length} Tasks')),
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
                  itemCount: workController.task.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 35.0, right: 20.0),
                          onLongPress: () {
                            Get.defaultDialog(
                              title:
                                  'Delete ${workController.task[index].title}',
                              middleText: 'Are you sure ?',
                              onCancel: () {},
                              confirmTextColor: Colors.white,
                              cancelTextColor: KYellowColor,
                              buttonColor: KYellowColor,
                              onConfirm: () {
                                workController.task.removeAt(index);
                                Get.back();
                              },
                            );
                          },
                          title: Text(workController.task[index].title!),
                          subtitle: Text(workController.task[index].subtitle!),
                          onTap: () {
                            workController.index = index;
                            workController.isediting.value = true;
                            textController.title!.text =
                                workController.task[index].title!;
                            //
                            //
                            textController.subtitle!.text =
                                workController.task[index].subtitle!;

                            Get.toNamed('/workadd');
                          },
                          trailing: Checkbox(
                            activeColor: KYellowColor,
                            onChanged: (value) {
                              workController.task[index].status =
                                  !workController.task[index].status!;
                              workController.task[index] =
                                  workController.task[index];
                            },
                            value: workController.task[index].status,
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
