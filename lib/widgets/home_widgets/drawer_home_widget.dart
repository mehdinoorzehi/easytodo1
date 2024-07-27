import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'oval_right_border_clipper.dart';

ClipPath drawerHome() {
  return ClipPath(
    clipper: OvalRightBorderClipper(),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Container(
      padding: const EdgeInsets.only(left: 16.0, right: 40),
      decoration: const BoxDecoration(
        color: Color(0xfff5f5f5),
      ),
      width: 300,
      height: 2000,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 80,
        diameterRatio: 1.7,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return ListTile(
              leading: Icon(
                icons[index],
                size: 30,
                color: Colors.black,
              ),
              title: Text(
                titles[index],
                style: boldTextStyle(color: Colors.black),
              ),
              onTap: () {
                // Navigator.of(context).pop();
                actions[index](context);
              },
            );
          },
          childCount: icons.length,
        ),
      ),
    ),
  );
}

final titles = [
  'EASY TODO',
  'Calendar',
  'Pomodoro',
  'Change Theme',
  'Change Language',
  'Contact us',
  'Tasks ⤵',
  'All',
  'Important',
  'Today',
  'Tomorrow',
  'Past History',
  'Done',
  'Undone',
];
final icons = [
  Icons.check_circle_rounded,
  Icons.calendar_month_outlined,
  Icons.access_time_outlined,
  Icons.brightness_4_outlined,
  Icons.language,
  Icons.assignment_ind_outlined,
  Icons.task_outlined,
  Icons.list_alt_outlined,
  Icons.star_border_outlined,
  Icons.today_outlined,
  Icons.edit_calendar_rounded,
  Icons.event_repeat_outlined,
  Icons.done_all_rounded,
  Icons.clear_rounded,
];
final actions = [
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
  (context) {},
];
//
//
//
