// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/task_controllers.dart';
import '../../controller/textfield_controllers.dart';
import '../../models/task_models.dart';

class GymAddPage extends StatelessWidget {
  const GymAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: SafeArea(
          child: Column(
            children: [
              AppBar(),
              MyTextField(),
              NoteWidget(),
              AddButton(),
            ],
          ),
        ));
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 350.0,
      child: ElevatedButton(
        onPressed: () {
          String text = Get.find<TextFieldControllers>().title!.text;
          if (text.isEmpty) {
            Get.snackbar('ERROR', 'Please enter some text',
                backgroundColor: KPinkColor);
          } else if (Get.find<GymTaskControllers>().isediting.value) {
            var task = Get.find<GymTaskControllers>()
                .task[Get.find<GymTaskControllers>().index];
            //
            task.title = Get.find<TextFieldControllers>().title!.text;
            task.subtitle = Get.find<TextFieldControllers>().subtitle!.text;
            //
            Get.find<GymTaskControllers>()
                .task[Get.find<GymTaskControllers>().index] = task;
            Get.back();
          } else {
            Get.find<GymTaskControllers>().task.add(
                  GymTaskModels(
                      title: Get.find<TextFieldControllers>().title!.text,
                      subtitle: Get.find<TextFieldControllers>().subtitle!.text,
                      status: false),
                );
            Get.back();
          }
        },
        style: TextButton.styleFrom(backgroundColor: KPinkColor),
        child: Text(
            Get.find<GymTaskControllers>().isediting.value ? 'Edit' : 'Add'),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: Get.find<TextFieldControllers>().subtitle,
              maxLength: 30,
              cursorColor: KPinkColor,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  prefixIcon: const Icon(
                    Icons.access_alarm_rounded,
                    color: Colors.grey,
                  ),
                  counter: Container(),
                  hintText: 'When should it be done?',
                  hintStyle: const TextStyle(fontSize: 14.0)),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 35.0, left: 38.0),
          child: Row(
            children: [
              const Icon(
                Icons.add_alert_rounded,
                color: Colors.grey,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    elevation: 0,
                  ),
                  onPressed: () {
                    FlutterAlarmClock.showAlarms();
                  },
                  child: const Text(
                    ' open\nAlarm',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: TextField(
          controller: Get.find<TextFieldControllers>().title,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.star),
            contentPadding: const EdgeInsets.only(top: 70.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(width: 1, color: Colors.black),
            ),
            labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
            labelText: "What are you planning ?",
            alignLabelWithHint: false,
            filled: true,
          ),
          cursorColor: KPinkColor,
          cursorHeight: 25.0,
          textInputAction: TextInputAction.done,
          cursorOpacityAnimates: true,
          style: const TextStyle(fontSize: 17.0),
          maxLength: 100,
          maxLines: 4,
          minLines: 1,
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 35.0),
                child: Text(
                  Get.find<GymTaskControllers>().isediting.value
                      ? 'Edit task'
                      : 'New gym task',
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close),
                iconSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
