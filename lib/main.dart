import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_get/pages/home/home_page.dart';
import 'package:test_get/pages/home1/home_page.dart';
import 'package:test_get/services/storage_service.dart';


Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // notification
  var initAndroidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
  var initIosSetting = IOSInitializationSettings();
  var initSetting =
  InitializationSettings(android: initAndroidSetting, iOS: initIosSetting);
  await FlutterLocalNotificationsPlugin().initialize(initSetting);
  await StorageService.init();
  runApp(MyApp());
}
// class Controller extends GetxController {
//   final box = GetStorage();
//   bool get isDark => box.read('darkmode') ?? false;
//   ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
//   void changeTheme(bool val) => box.write('darkmode', val);
// }
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage1(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
