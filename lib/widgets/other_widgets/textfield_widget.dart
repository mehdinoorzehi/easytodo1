import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/textfield_controllers.dart';

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