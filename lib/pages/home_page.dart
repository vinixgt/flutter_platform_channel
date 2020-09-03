import 'package:flutter/material.dart';
import 'package:flutter_platform_channel/controller/home_controller.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        body: Center(
          child: FlatButton(
            onPressed: () {
              if(_.tracking) {
                _.stopTracking();
              } else {
                _.startTracking();
              }
            },
            child: GetBuilder<HomeController>(
              id: 'tracking', 
              builder: (_) => Text("${_.tracking ? 'Stop' : 'Start'} Tracking"),
            )
          )
        ),
      ),
    );
  }
}