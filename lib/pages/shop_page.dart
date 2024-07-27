// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';

import '../widgets/other_widgets/floating_action_button_widget.dart';
import '../widgets/other_widgets/text_avatar_in_top_container_widget.dart';

class shopPage extends StatelessWidget {
  const shopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPhiroozeColor,
      floatingActionButton: MyFloatingActionButton(
        backGroundColor: KPhiroozeColor,
        onTap: () {
          Get.find<ShopTaskControllers>().isediting.value = false;
          Get.find<TextFieldControllers>().title!.text = '';
          Get.find<TextFieldControllers>().subtitle!.text = '';
          Get.toNamed('/shopadd');
        },
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(() => TextsAndAvatarInTopContainer(
                imageAddress: 'assets/animations/shop2.json',
                title: 'Shop',
                subTitle:
                    ' ${Get.find<ShopTaskControllers>().task.length} Tasks')),
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
                  itemCount: shopController.task.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 35.0, right: 20.0),
                          onLongPress: () {
                            Get.defaultDialog(
                              title:
                                  'Delete ${shopController.task[index].title}',
                              middleText: 'Are you sure ?',
                              onCancel: () {},
                              confirmTextColor: Colors.white,
                              cancelTextColor: KPhiroozeColor,
                              buttonColor: KPhiroozeColor,
                              onConfirm: () {
                                shopController.task.removeAt(index);
                                Get.back();
                              },
                            );
                          },
                          title: Text(shopController.task[index].title!),
                          subtitle: Text(shopController.task[index].subtitle!),
                          onTap: () {
                            shopController.index = index;
                            shopController.isediting.value = true;
                            textController.title!.text =
                                shopController.task[index].title!;
                            //
                            //
                            textController.subtitle!.text =
                                shopController.task[index].subtitle!;

                            Get.toNamed('/shopadd');
                          },
                          trailing: Checkbox(
                            activeColor: KPhiroozeColor,
                            onChanged: (value) {
                              shopController.task[index].status =
                                  !shopController.task[index].status!;
                              shopController.task[index] =
                                  shopController.task[index];
                            },
                            value: shopController.task[index].status,
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
