import 'package:get/get.dart';

class NotifsController extends GetxController {
  var notif = "Notification".obs;

  void notifOn() async{
    this.notif.value = "Notification ON";
  }

  void notifOff() async{
    this.notif.value = "Notification OFF";
  }

}