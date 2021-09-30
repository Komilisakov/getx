import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notifs_controller.dart';

class NotifsPage extends StatefulWidget {
  static final String id = "/notifs_page";

  const NotifsPage({Key? key}) : super(key: key);

  @override
  _NotifsPageState createState() => _NotifsPageState();
}

class _NotifsPageState extends State<NotifsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app_name".tr),
      ),
      body: Obx(
          ()=> Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Get.find<NotifsController>().notif.value,style: TextStyle(color: Colors.black,fontSize: 20),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.find<NotifsController>().notifOff();
                        },
                        child: Text("OFF")
                    ),
                    TextButton(
                        onPressed: () {
                          Get.find<NotifsController>().notifOn();
                        },
                        child: Text("ON")
                    )
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
