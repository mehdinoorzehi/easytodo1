// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';

import '../widgets/other_widgets/floating_action_button_widget.dart';
import '../widgets/other_widgets/text_avatar_in_top_container_widget.dart';

class travelPage extends StatelessWidget {
  const travelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KTealColor,
      floatingActionButton: MyFloatingActionButton(
        backGroundColor: KTealColor,
        onTap: () {
          Get.find<TravelTaskControllers>().isediting.value = false;
          Get.find<TextFieldControllers>().title!.text = '';
          Get.find<TextFieldControllers>().subtitle!.text = '';
          Get.toNamed('/traveladd');
        },
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(() => TextsAndAvatarInTopContainer(
                imageAddress: 'assets/animations/travel.json',
                title: 'Travel',
                subTitle:
                    ' ${Get.find<TravelTaskControllers>().task.length} Tasks')),
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
                  itemCount: travelController.task.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 35.0, right: 20.0),
                          onLongPress: () {
                            Get.defaultDialog(
                              title:
                                  'Delete ${travelController.task[index].title}',
                              middleText: 'Are you sure ?',
                              onCancel: () {},
                              confirmTextColor: Colors.white,
                              cancelTextColor: KTealColor,
                              buttonColor: KTealColor,
                              onConfirm: () {
                                travelController.task.removeAt(index);
                                Get.back();
                              },
                            );
                          },
                          title: Text(travelController.task[index].title!),
                          subtitle:
                              Text(travelController.task[index].subtitle!),
                          onTap: () {
                            travelController.index = index;
                            travelController.isediting.value = true;
                            textController.title!.text =
                                travelController.task[index].title!;
                            //
                            //
                            textController.subtitle!.text =
                                travelController.task[index].subtitle!;

                            Get.toNamed('/traveladd');
                          },
                          trailing: Checkbox(
                            activeColor: KTealColor,
                            onChanged: (value) {
                              travelController.task[index].status =
                                  !travelController.task[index].status!;
                              travelController.task[index] =
                                  travelController.task[index];
                            },
                            value: travelController.task[index].status,
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
