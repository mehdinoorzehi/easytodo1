import 'package:get/get.dart';

import '../controller/task_controllers.dart';
import '../controller/textfield_controllers.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(WorkTaskControllers());
    Get.put(MusicTaskControllers());
    Get.put(MovieTaskControllers());
    Get.put(StudyTaskControllers());
    Get.put(HomeTaskControllers());
    Get.put(ShopTaskControllers());
    Get.put(ArtTaskControllers());
    Get.put(TravelTaskControllers());
    Get.put(GymTaskControllers());
    Get.put(TextFieldControllers());
  }
}
