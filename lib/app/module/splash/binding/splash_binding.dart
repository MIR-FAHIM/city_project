import 'package:cityproject/app/module/home/controller/home_controller.dart';
import 'package:cityproject/app/module/splash/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
          () => SplashController(),
    );
  }
}
