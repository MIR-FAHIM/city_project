// import 'dart:html';

import 'dart:io';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityproject/app/module/home/controller/home_controller.dart';
import 'package:cityproject/app/module/splash/controller/splash_controller.dart';
import 'package:cityproject/common/Color.dart';
import 'package:cityproject/common/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashView extends GetView<SplashController> {
  final _size = Get.size;

  @override
  SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<SplashController>();
    final controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColors.primaryLightColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // height: size.width * .35,
            // width: size.width * .35,
            Center(
              child: SizedBox(
                height: size.width * .50,
                width: size.width * .50,
                child: Obx(()=> Image.asset("assets/images/splash_screen/${controller.splashScreenImages.value}")),
              ),
            ),

            // Image(
            //   height: 200,
            //   width: 200,
            //   image: AssetImage(
            //     'assets/Logow.png',
            //   ),
            // ),

            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Ui.customLoaderSplash(),
            )
          ],
        ),
      ),
    );
  }





}


