import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldControllers extends GetxController {
  TextEditingController? title;
  TextEditingController? subtitle;

  @override
  void onInit() {
    title = TextEditingController();
    subtitle = TextEditingController();
    super.onInit();
  }
}
