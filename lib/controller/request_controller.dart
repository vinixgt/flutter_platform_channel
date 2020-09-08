import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';


import 'package:flutter_platform_channel/native/geolocation.dart';

class RequestController extends GetxController {

  Future<void> request() async {
    final PermissionStatus status = await Geolocation.instance.requestPermission();
    print('Calling requestPermissions');
    if(status == PermissionStatus.granted) {
      print('******** Permision granted');
      Get.offNamed('home');
    } else {
      print('******** Permission other permission');
    }
  }
}