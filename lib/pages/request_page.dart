import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:flutter_platform_channel/controller/request_controller.dart';

class RequestPage extends StatefulWidget {
  RequestPage({Key key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
      init: RequestController(),
      builder: (_) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                  textAlign: TextAlign.center,
              ),
              SizedBox(height: 10,),
              CupertinoButton(
                child: Text(
                  "Allow",
                  style: TextStyle(letterSpacing: 1)
                ),
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(30),
                onPressed: _.request,
              )
            ],
          )
        ),
      ), 
    );
  }
}