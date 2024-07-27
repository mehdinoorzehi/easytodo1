// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';

import '../widgets/other_widgets/floating_action_button_widget.dart';
import '../widgets/other_widgets/text_avatar_in_top_container_widget.dart';

class studyPage extends StatelessWidget {
  const studyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPurpleColor,
      floatingActionButton: MyFloatingActionButton(
        backGroundColor: KPurpleColor,
        onTap: () {
          Get.find<StudyTaskControllers>().isediting.value = false;
          Get.find<TextFieldControllers>().title!.text = '';
          Get.find<TextFieldControllers>().subtitle!.text = '';
          Get.toNamed('/studyadd');
        },
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(() => TextsAndAvatarInTopContainer(
                imageAddress: 'assets/animations/study.json',
                title: 'Study',
                subTitle:
                    ' ${Get.find<StudyTaskControllers>().task.length} Tasks')),
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
                  itemCount: studyController.task.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 35.0, right: 20.0),
                          onLongPress: () {
                            Get.defaultDialog(
                              title:
                                  'Delete ${studyController.task[index].title}',
                              middleText: 'Are you sure ?',
                              onCancel: () {},
                              confirmTextColor: Colors.white,
                              cancelTextColor: KPurpleColor,
                              buttonColor: KPurpleColor,
                              onConfirm: () {
                                studyController.task.removeAt(index);
                                Get.back();
                              },
                            );
                          },
                          title: Text(studyController.task[index].title!),
                          subtitle: Text(studyController.task[index].subtitle!),
                          onTap: () {
                            studyController.index = index;
                            studyController.isediting.value = true;
                            textController.title!.text =
                                studyController.task[index].title!;
                            //
                            //
                            textController.subtitle!.text =
                                studyController.task[index].subtitle!;

                            Get.toNamed('/studyadd');
                          },
                          trailing: Checkbox(
                            activeColor: KPurpleColor,
                            onChanged: (value) {
                              studyController.task[index].status =
                                  !studyController.task[index].status!;
                              studyController.task[index] =
                                  studyController.task[index];
                            },
                            value: studyController.task[index].status,
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
