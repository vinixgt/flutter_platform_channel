import 'package:flutter/material.dart';
import 'package:flutter_platform_channel/native/geolocation.dart';
import 'package:flutter_platform_channel/pages/home_page.dart';
import 'package:flutter_platform_channel/pages/request_page.dart';
import 'package:flutter_platform_channel/pages/splash_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
      onInit: () {
        Geolocation.instance.init();
      },
      onDispose: Geolocation.instance.dispose(),
      routes: {
        'home': (_) => HomePage(),
        'request': (_) => RequestPage(),

      }
    );
  }
}
