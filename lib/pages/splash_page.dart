import 'package:flutter/material.dart';
import 'package:flutter_platform_channel/controller/splash_controller.dart';
import 'package:get/state_manager.dart';


class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
        
      ),
    );
  }
}