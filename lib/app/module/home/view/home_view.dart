// import 'dart:html';

import 'dart:io';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityproject/app/module/home/controller/home_controller.dart';
import 'package:cityproject/app/module/splash/controller/splash_controller.dart';
import 'package:cityproject/app/routes/app_pages.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends GetView<HomeController> {
  final _size = Get.size;

  @override
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double widthCount = Get.width;
    double heightCount = Get.height;
    return WillPopScope(
      onWillPop: () async {
        return exit(0);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ---> Stack for Slider part <--- ///
              Stack(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 10, right: 10, bottom: 5),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Menu Icon Button
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                            Obx(() {
                              return Container(
                                width: Get.width * .6,
                                color: Colors.white,
                                child: DropdownSearch<String>(
                                  label: "Select District",
                                  mode: Mode.MENU,
                                  showSearchBox: true,
                                  showSelectedItems: true,
                                  items: [
                                    "Dhaka",
                                    "Jessore",
                                    "Chittagong",
                                    "Nilphamari",
                                    "Barishal",
                                    "Shyllet"
                                  ],
                                  onChanged: (input) {
                                    controller.selectedDis.value = input!;
                                  },
                                  selectedItem: controller.selectedDis.value,
                                ),
                              );
                            }),

                            //Icons for Notification
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ))
                          ]),
                    ),
                  )
                      .box
                      .size(widthCount, heightCount * 0.22)
                      .color(redColor)
                      .make(),

                  ///Slider Part ** Add Image according to you ///
                  Positioned(
                      bottom: 0,
                      left: 30,
                      right: 30,
                      // top: 80,
                      child: VxSwiper(
                              autoPlay: false,
                              viewportFraction: 1.0,
                              items: [
                            ///**Can Use List.generate for multi news also */
                            sliderContainer(
                                date: "28 Januarty,2024",

                                ///Date will be according to news day
                                headLine:
                                    "This is the HeadLine of News Trending",

                                ///HeadLine on the news
                                imagePath:
                                    "assets/service_assets/247service.jpg",

                                ///Image of the news
                                onpress: () {}

                                ///Function where it will take clicking ReadMore
                                ),
                            sliderContainer(
                                date: "25 Januarty,2024",
                                headLine:
                                    "Todays Trending Headline is that this is ",
                                imagePath:
                                    "assets/service_assets/247service.jpg",
                                onpress: () {}),
                            sliderContainer(
                                date: "23 January,2024",
                                headLine:
                                    "Headline and Date will be changing according to the news",
                                imagePath:
                                    "assets/service_assets/247service.jpg",
                                onpress: () {}),
                          ])
                          .box
                          .size(widthCount * 0.9, heightCount * 0.17)
                          .color(Vx.white)
                          .border(color: redColor)
                          .rounded
                          .make())
                ],
              ).box.height(heightCount * 0.28).make(),
              10.heightBox,

              /// ---> Second part Offering Services Start Here <--- ///

              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Services We Offer".text.semiBold.size(18).black.make(),
                      10.heightBox,
                      //*  Home Services Category *//
                      servicePartCategory(
                        context: context,
                        categoryName: "Housing and Utilities:",
                        itemCount: controller.homeServices.length,
                        serviceIcon: controller.homeServices,
                        serviceName: controller.homeServicesName,
                      ),
                      16.heightBox,

                      //*  Community  Services Category *//
                      servicePartCategory(
                        context: context,
                        categoryName: "Community Services",
                        itemCount: controller.communityServices.length,
                        serviceIcon: controller.communityServices,
                        serviceName: controller.communityServicesName,
                      ),
                      16.heightBox,

                      //*  Utiliy  Services Category *//
                      servicePartCategory(
                        context: context,
                        categoryName: "Transportation",
                        itemCount: controller.utilitiesService.length,
                        serviceIcon: controller.utilitiesService,
                        serviceName: controller.utilityServicesName,
                      ),
                      servicePartCategory(
                        context: context,
                        categoryName: "Healthcare",
                        itemCount: controller.utilitiesService.length,
                        serviceIcon: controller.utilitiesService,
                        serviceName: controller.utilityServicesName,
                      ),
                      servicePartCategory(
                        context: context,
                        categoryName: "Education",
                        itemCount: controller.utilitiesService.length,
                        serviceIcon: controller.utilitiesService,
                        serviceName: controller.utilityServicesName,
                      ),
                      servicePartCategory(
                        context: context,
                        categoryName: "Shopping",
                        itemCount: controller.utilitiesService.length,
                        serviceIcon: controller.utilitiesService,
                        serviceName: controller.utilityServicesName,
                      ),

                      /// ---> Trednig Service Showing part Start Here <--- ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Trending Services"
                              .text
                              .semiBold
                              .size(18)
                              .black
                              .make(),
                          Icon(
                            Icons.trending_up_outlined,
                            size: 35,
                            color: redColor,
                          )
                        ],
                      ),

                      //*Trending Services Part List View *//
                      SizedBox(
                        height: 130,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.trendingService.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          controller.trendingService[index],
                                          fit: BoxFit.scaleDown,
                                        ),
                                        controller.trendingServiceName[index]
                                            .toString()
                                            .text
                                            .semiBold
                                            .size(3)
                                            .make(),
                                      ]),
                                )
                                    .box
                                    .size(100, 130)
                                    .color(redColor.withOpacity(0.3))
                                    .roundedSM
                                    .make(),
                              );
                            }),
                      ),
                    ],
                  )),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }

//custom color
  final redColor = Color.fromARGB(255, 243, 92, 92);

  ///--- > Custom Widget for Category Part <---///

  Widget servicePartCategory({
    context,
    int? itemCount,
    String? categoryName,
    List<String>? serviceName,
    List<String>? serviceIcon,
  }) {
    double widthCount = Get.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        categoryName //catergory name
            .toString()
            .text
            .size(10)
            .semiBold
            .makeCentered()
            .box
            .size(widthCount * 0.4, 30)
            .border(color: redColor)
            .roundedSM
            .make(),
        5.heightBox,
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ListView.builder(
              //list of category item
              itemCount: itemCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.TOLETHOME);
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              //category service icons
                              serviceIcon![index].toString(),
                              height: 50,
                              width: 50,
                            ),
                          ),
                        )
                            .box
                            .size(60, 60)
                            .roundedFull
                            .color(redColor.withOpacity(0.3))
                            .make(),
                      ),
                      serviceName![index] //category service name
                          .toString()
                          .text
                          .size(8)
                          .overflow(TextOverflow.fade)
                          .semiBold
                          .make(),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  /// ---> News Showing in Slider <--- ///

  Widget sliderContainer(
      {String? date, String? headLine, String? imagePath, onpress}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          date.toString().text.size(6).gray500.make(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  headLine
                      .toString()
                      .text
                      .bold
                      .extraBlack
                      .overflow(TextOverflow.fade)
                      .maxLines(3)
                      .make(),
                  5.heightBox,
                  GestureDetector(
                    onTap: onpress,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        "Read More"
                            .text
                            .size(15)
                            .semiBold
                            .color(redColor)
                            .makeCentered(),
                        5.widthBox,
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  )
                ],
              ).box.width(200).make(),
              5.widthBox,
              SizedBox(
                height: 80,
                width: 50,
                child: Image.asset(
                  imagePath.toString(),
                  height: 50,
                  width: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
