import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/textfield_controllers.dart';

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
              cursorColor: KLightPurpleColor,
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
