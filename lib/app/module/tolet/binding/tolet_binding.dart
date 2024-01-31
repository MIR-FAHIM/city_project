import 'package:cityproject/app/module/home/controller/home_controller.dart';
import 'package:cityproject/app/module/tolet/controller/tolet_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class ToletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToletController>(
          () => ToletController(),
    );
  }
}
