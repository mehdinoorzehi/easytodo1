// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/task_controllers.dart';
import 'controller/textfield_controllers.dart';

const KBlackColor = Colors.black87;
const KLightBlueColor = Color(0xff5886ff);
const KYellowColor = Color(0xffFDBB78);
const KOrangeColor = Color(0xffF89784);
const KGreenColor = Color(0xff56CC7C);
const KPurpleColor = Color(0xff8E87D2);
const KRedColor = Color(0xffDD6A5B);
const KLightPurpleColor = Color(0xffAD69C6);
const KPhiroozeColor = Color(0xff41B3BF);
const KPinkColor = Colors.redAccent;
const KTealColor = Colors.teal;
const KwhiteColor = Color(0xfff5f5f5);
//
//
//
final textController = Get.find<TextFieldControllers>();
final artController = Get.find<ArtTaskControllers>();
final gymController = Get.find<GymTaskControllers>();
final homeController = Get.find<HomeTaskControllers>();
final movieController = Get.find<MovieTaskControllers>();
final musicController = Get.find<MusicTaskControllers>();
final shopController = Get.find<ShopTaskControllers>();
final studyController = Get.find<StudyTaskControllers>();
final travelController = Get.find<TravelTaskControllers>();
final workController = Get.find<WorkTaskControllers>();
