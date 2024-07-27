// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';

import '../widgets/other_widgets/floating_action_button_widget.dart';
import '../widgets/other_widgets/text_avatar_in_top_container_widget.dart';

class artPage extends StatelessWidget {
  const artPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KLightPurpleColor,
      floatingActionButton: MyFloatingActionButton(
        backGroundColor: KLightPurpleColor,
        onTap: () {
          Get.find<ArtTaskControllers>().isediting.value = false;
          Get.find<TextFieldControllers>().title!.text = '';
          Get.find<TextFieldControllers>().subtitle!.text = '';
          Get.toNamed('/artadd');
        },
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(() => TextsAndAvatarInTopContainer(
                marginLeft: 17,
                imageAddress: 'assets/animations/art.json',
                title: 'Art',
                subTitle:
                    ' ${Get.find<ArtTaskControllers>().task.length} Tasks')),
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
                  itemCount: artController.task.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 35.0, right: 20.0),
                          onLongPress: () {
                            Get.defaultDialog(
                              title:
                                  'Delete ${artController.task[index].title}',
                              middleText: 'Are you sure ?',
                              onCancel: () {},
                              confirmTextColor: Colors.white,
                              cancelTextColor: KLightPurpleColor,
                              buttonColor: KLightPurpleColor,
                              onConfirm: () {
                                artController.task.removeAt(index);
                                Get.back();
                              },
                            );
                          },
                          title: Text(artController.task[index].title!),
                          subtitle: Text(artController.task[index].subtitle!),
                          onTap: () {
                            artController.index = index;
                            artController.isediting.value = true;
                            textController.title!.text =
                                artController.task[index].title!;
                            //
                            //
                            textController.subtitle!.text =
                                artController.task[index].subtitle!;

                            Get.toNamed('/artadd');
                          },
                          trailing: Checkbox(
                            activeColor: KLightPurpleColor,
                            onChanged: (value) {
                              artController.task[index].status =
                                  !artController.task[index].status!;
                              artController.task[index] =
                                  artController.task[index];
                            },
                            value: artController.task[index].status,
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
