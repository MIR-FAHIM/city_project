import 'dart:async';
import 'dart:math';

import 'package:cityproject/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SplashController extends GetxController {
  //TODO: Implement HomeController
  RxString splashScreenImages = ''.obs;
  int lastSplashScreenIndex = -1;

  final balance = '0.0'.obs;
  final phoneController = TextEditingController().obs;



  @override
  Future<void> onInit() async {
    loadSplashScreen();
    print('SplashscreenController.onInit');
    //Get.find<BookingController>().filterdListingController();
    Timer(const Duration(seconds: 3), () {

     Get.toNamed(Routes.HOME);

    });

    super.onInit();
  }

  Future refreshHome() async {

  }



  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  void loadSplashScreen() {
    String newSplashScreenImage = getRandomSplashScreen();
    splashScreenImages.value = newSplashScreenImage;
  }
  String getRandomSplashScreen() {
    List<String> splashScreens = [
      'splash_1.png',
      'splash_2.png',
      'splash_3.png',
      'splash_4.png',
      'splash_5.png',
      // Add more splash screens as needed
    ];
    int index;
    do {
      index = getRandomIndex(splashScreens.length);
    } while (index == lastSplashScreenIndex);

    lastSplashScreenIndex = index;
    return splashScreens[index];
  }

  int getRandomIndex(int max) {
    Random random = Random();
    return random.nextInt(max);
  }

}


