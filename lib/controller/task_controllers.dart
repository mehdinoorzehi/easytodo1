import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/task_models.dart';

class WorkTaskControllers extends GetxController {
  var index = 0;
  var isediting = false.obs;
  var task = <WorkTaskModels>[].obs;
  @override
  void onInit() {
    var box = GetStorage();

    if (box.read('task') != null) {
      var list = box.read('task');
      for (var item in list) {
        task.add(WorkTaskModels.fromJson(item));
      }
    }
    ever(task, (value) => {box.write('task', task.toJson())});
    super.onInit();
  }
}

//
//
class MusicTaskControllers extends GetxController {
  var index = 0;
  var isediting = false.obs;
  var task = <MusicTaskModels>[].obs;
  @override
  void onInit() {
    var box2 = GetStorage();

    if (box2.read('task2') != null) {
      var list = box2.read('task2');
      for (var item in list) {
        task.add(MusicTaskModels.fromJson(item));
      }
    }
    ever(task, (value) => {box2.write('task2', task.toJson())});
    super.onInit();
  }
}

//
//
class MovieTaskControllers extends GetxController {
  var index = 0;
  var isediting = false.obs;
  var task = <MovieTaskModels>[].obs;
  @override
  void onInit() {
    var box3 = GetStorage();

    if (box3.read('task3') != null) {
      var list = box3.read('task3');
      for (var item in list) {
        task.add(MovieTaskModels.fromJson(item));
      }
    }
    ever(task, (value) => {box3.write('task3', task.toJson())});
    super.onInit();
  }
}

//
//
class StudyTaskControllers extends GetxController {
  var index = 0;
  var isediting = false.obs;
  var task = <StudyTaskModels>[].obs;
  @override
  void onInit() {
    var box4 = GetStorage();

    if (box4.read('task4') != null) {
      var list = box4.read('task4');
      for (var item in list) {
        task.add(StudyTaskModels.fromJson(item));
      }
    }
    ever(task, (value) => {box4.write('task4', task.toJson())});
    super.onInit();
  }
}

//
//
class HomeTaskControllers extends GetxController {
  var index = 0;
  var isediting = false.obs;
  var task = <HomeTaskModels>[].obs;
  @override
  void onInit() {
    var box5 = GetStorage();

    if (box5.read('task5') != null) {
      var list = box5.read('task5');
      for (var item in list) {
        task.add(HomeTaskModels.fromJson(item));
      }
    }
    ever(task, (value) => {box5.write('task5', task.toJson())});
    super.onInit();
  }
}

//
//
class ShopTaskControllers extends GetxController {
  var index = 0;
  var isediting = false.obs;
  var task = <ShopTaskModels>[].obs;
  @override
  void onInit() {
    var box6 = GetStorage();

    if (box6.read('task6') != null) {
      var list = box6.read('task6');
      for (var item in list) {
        task.add(ShopTaskModels.fromJson(item));
      }
    }
    ever(task, (value) => {box6.write('task6', task.toJson())});
    super.onInit();
  }
}

//
//
class ArtTaskControllers extends GetxController {
  var index = 0;
  var isediting = false.obs;
  var task = <ArtTaskModels>[].obs;
  @override
  void onInit() {
    var box7 = GetStorage();

    if (box7.read('task7') != null) {
      var list = box7.read('task7');
      for (var item in list) {
        task.add(ArtTaskModels.fromJson(item));
      }
    }
    ever(task, (value) => {box7.write('task7', task.toJson())});
    super.onInit();
  }
}

//
//
class TravelTaskControllers extends GetxController {
  var index = 0;
  var isediting = false.obs;
  var task = <TravelTaskModels>[].obs;
  @override
  void onInit() {
    var box8 = GetStorage();

    if (box8.read('task8') != null) {
      var list = box8.read('task8');
      for (var item in list) {
        task.add(TravelTaskModels.fromJson(item));
      }
    }
    ever(task, (value) => {box8.write('task8', task.toJson())});
    super.onInit();
  }
}

//
//
class GymTaskControllers extends GetxController {
  var index = 0;
  var isediting = false.obs;
  var task = <GymTaskModels>[].obs;
  @override
  void onInit() {
    var box9 = GetStorage();

    if (box9.read('task9') != null) {
      var list = box9.read('task9');
      for (var item in list) {
        task.add(GymTaskModels.fromJson(item));
      }
    }
    ever(task, (value) => {box9.write('task9', task.toJson())});
    super.onInit();
  }
}
