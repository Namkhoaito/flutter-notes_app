import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    SplashController _splashController = Get.find<SplashController>();
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
