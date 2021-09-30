
import 'dart:io';
import 'dart:math';

import 'package:device_info/device_info.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Utils{

  static Future<Map<String, String>>  deviceParams() async{
    Map<String, String> params = new Map();
    var deviceInfo = DeviceInfoPlugin();
    String fcm_token = ""; //await Prefs.loadFCM();

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      params.addAll({
        'device_id': iosDeviceInfo.identifierForVendor,
        'device_type': "I",
        'device_token': fcm_token,
      });
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      params.addAll({
        'device_id': androidDeviceInfo.androidId,
        'device_type': "A",
        'device_token': fcm_token,
      });
    }
    return params;
  }

  static bool isEmpty(String str){
    return str != null && !str.isEmpty;
  }

  static Future<void> showLocalNotification(String title, String body) async {

    var android = AndroidNotificationDetails('channelId', 'channelName', 'channelDescription');
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);

    int id = Random().nextInt(100);
    await FlutterLocalNotificationsPlugin().show(id, title, body, platform);
  }

}