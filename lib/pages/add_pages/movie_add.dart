import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../models/task_models.dart';
import '../../widgets/other_widgets/add_button_widget.dart';
import '../../widgets/other_widgets/appbar_widget.dart';
import '../../widgets/other_widgets/note_and_button_clock_widget.dart';
import '../../widgets/other_widgets/textfield_widget.dart';

class MovieAddPage extends StatelessWidget {
  const MovieAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: SafeArea(
          child: Column(
            children: [
              const MyAppBarWidget(),
              const MyTextField(),
              const NoteWidget(),
              AddButton(
                backGroundColor: KGreenColor,
                text: movieController.isediting.value ? 'Edit' : 'Add',
                onTap: () {
                  String text = textController.title!.text;
                  if (text.isEmpty) {
                    Get.snackbar('ERROR', 'Please enter some text',
                        backgroundColor: KGreenColor);
                  } else if (movieController.isediting.value) {
                    var task = movieController.task[movieController.index];
                    //
                    task.title = textController.title!.text;
                    task.subtitle = textController.subtitle!.text;
                    //
                    movieController.task[movieController.index] = task;
                    Get.back();
                  } else {
                    movieController.task.add(
                      MovieTaskModels(
                          title: textController.title!.text,
                          subtitle: textController.subtitle!.text,
                          status: false),
                    );
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ));
  }
}
