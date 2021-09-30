
import 'package:get/get.dart';
import 'package:test_get/pages/notifs/notifs_controller.dart';

class AllControlerBinding implements Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<NotifsController>(NotifsController());
  }
}