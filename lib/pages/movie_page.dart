// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';

import '../widgets/other_widgets/floating_action_button_widget.dart';
import '../widgets/other_widgets/text_avatar_in_top_container_widget.dart';

class moviePage extends StatelessWidget {
  const moviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KGreenColor,
      floatingActionButton: MyFloatingActionButton(
        backGroundColor: KGreenColor,
        onTap: () {
          Get.find<MovieTaskControllers>().isediting.value = false;
          Get.find<TextFieldControllers>().title!.text = '';
          Get.find<TextFieldControllers>().subtitle!.text = '';
          Get.toNamed('/movieadd');
        },
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(() => TextsAndAvatarInTopContainer(
                imageAddress: 'assets/animations/movie.json',
                title: 'Movie',
                subTitle:
                    ' ${Get.find<MovieTaskControllers>().task.length} Tasks')),
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
                  itemCount: movieController.task.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 35.0, right: 20.0),
                          onLongPress: () {
                            Get.defaultDialog(
                              title:
                                  'Delete ${movieController.task[index].title}',
                              middleText: 'Are you sure ?',
                              onCancel: () {},
                              confirmTextColor: Colors.white,
                              cancelTextColor: KGreenColor,
                              buttonColor: KGreenColor,
                              onConfirm: () {
                                movieController.task.removeAt(index);
                                Get.back();
                              },
                            );
                          },
                          title: Text(movieController.task[index].title!),
                          subtitle: Text(movieController.task[index].subtitle!),
                          onTap: () {
                            movieController.index = index;
                            movieController.isediting.value = true;
                            textController.title!.text =
                                movieController.task[index].title!;
                            //
                            //
                            textController.subtitle!.text =
                                movieController.task[index].subtitle!;

                            Get.toNamed('/movieadd');
                          },
                          trailing: Checkbox(
                            activeColor: KGreenColor,
                            onChanged: (value) {
                              movieController.task[index].status =
                                  !movieController.task[index].status!;
                              movieController.task[index] =
                                  movieController.task[index];
                            },
                            value: movieController.task[index].status,
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
