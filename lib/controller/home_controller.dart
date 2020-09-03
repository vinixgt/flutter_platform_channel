import 'package:flutter_platform_channel/native/geolocation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  
  bool _tracking = false;
  bool get tracking => _tracking;

  Future<void> startTracking() async {
    await Geolocation.instance.start();
    _tracking = true;
    update(['tracking']);
  }

  Future<void> stopTracking() async {
    await Geolocation.instance.stop();
    _tracking = false;
    update(['tracking']);
  }
}