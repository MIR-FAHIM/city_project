import 'package:cityproject/app/module/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}
