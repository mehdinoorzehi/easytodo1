// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import '../../controller/task_controllers.dart';
import '../../controller/textfield_controllers.dart';
import '../../models/task_models.dart';

// ignore: camel_case_types
class pTravelAddPage extends StatelessWidget {
  const pTravelAddPage({super.key});

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
            Get.snackbar('خطا', 'لطفا متنی را وارد کنید',
                padding: const EdgeInsets.only(
                    top: 8.0, right: 15.0, left: 15.0, bottom: 8.0),
                titleText: const Text(
                  'خطا',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                messageText: const Text(
                  'لطفا متنی را وارد کنید',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15.0),
                ),
                backgroundColor: KTealColor);
          } else if (Get.find<TravelTaskControllers>().isediting.value) {
            var task = Get.find<TravelTaskControllers>()
                .task[Get.find<TravelTaskControllers>().index];
            //
            task.title = Get.find<TextFieldControllers>().title!.text;
            task.subtitle = Get.find<TextFieldControllers>().subtitle!.text;
            //
            Get.find<TravelTaskControllers>()
                .task[Get.find<TravelTaskControllers>().index] = task;
            Get.back();
          } else {
            Get.find<TravelTaskControllers>().task.add(
                  TravelTaskModels(
                      title: Get.find<TextFieldControllers>().title!.text,
                      subtitle: Get.find<TextFieldControllers>().subtitle!.text,
                      status: false),
                );
            Get.back();
          }
        },
        style: TextButton.styleFrom(backgroundColor: KTealColor),
        child: Text(Get.find<TravelTaskControllers>().isediting.value
            ? 'ویرایش'
            : 'اضافه کردن'),
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
              textDirection: TextDirection.rtl,
              controller: Get.find<TextFieldControllers>().subtitle,
              maxLength: 30,
              cursorColor: KTealColor,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  suffixIcon: const Icon(
                    Icons.access_alarm_rounded,
                    color: Colors.grey,
                  ),
                  counter: Container(),
                  hintTextDirection: TextDirection.rtl,
                  hintText: 'چه زمانی باید انجام بشه ؟',
                  hintStyle: const TextStyle(fontSize: 15.0)),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 35.0, right: 35.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey,
                      elevation: 0,
                    ),
                    onPressed: () {
                      FlutterAlarmClock.showAlarms();
                    },
                    child: const Text(
                      'باز کردن\n   آلارم',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: const Icon(
                  Icons.add_alert_rounded,
                  color: Colors.grey,
                ),
              ),
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
          textDirection: TextDirection.rtl,
          controller: Get.find<TextFieldControllers>().title,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.star),
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
            hintText: "برنامت چیه ؟",
            hintTextDirection: TextDirection.rtl,
            floatingLabelAlignment: FloatingLabelAlignment.start,
          ),
          cursorColor: KTealColor,
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
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 35.0),
                child: Text(
                  Get.find<TravelTaskControllers>().isediting.value
                      ? ' ویرایش تسک'
                      : 'تسک جدید سفر',
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
