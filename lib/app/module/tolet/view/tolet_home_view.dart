import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cityproject/app/module/tolet/controller/tolet_controller.dart';
import 'package:cityproject/common/Color.dart';
import 'package:cityproject/common/ui.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../routes/app_pages.dart';

class ToletHomeView extends GetView<ToletController> {
  const ToletHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.jaygaAppBackGroundWhite,
      body: WillPopScope(
        onWillPop: () async {
          final value = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const Text('Are you sure you want to exit?'),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      //return false when click on "NO"
                      child: const Text('No'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      //return true when click on "Yes"
                      child: const Text('Yes'),
                    ),
                  ],
                );
              });
          return value == true;
        },
        child: Obx(() {
          return RefreshIndicator(
            onRefresh: () async {
              print("hlw refresh +++++++++++++++++++++");
              await controller.filterdListingController();
            },
            child: SingleChildScrollView(
              //physics: ScrollPhy,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Find your next",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                "Place ",
                                style: TextStyle(
                                    fontSize: 26,
                                    color: AppColors.textColorGreen,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "to stay",
                                style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: Get.height * .07,
                      decoration: BoxDecoration(
                          color: AppColors.jaygaWhite,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 08, right: 010),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                //Get.toNamed(Routes.SEARCHPAGEVIEW);
                              },
                              child: SizedBox(
                                width: Get.width * .8,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height:
                                      MediaQuery.of(context).size.height *
                                          .08,
                                      width: MediaQuery.of(context).size.width *
                                          .08,
                                      child: Image.asset(
                                        'assets/booking/assets/drive/search.png',
                                        height:
                                        MediaQuery.of(context).size.height *
                                            .08,
                                        width:
                                        MediaQuery.of(context).size.width *
                                            .08,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text("Search your place"),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                              //  Get.toNamed(Routes.SEARCHPAGE);
                                //Get.toNamed(Routes.FILTERPAGE);
                              },
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * .1,
                                width: MediaQuery.of(context).size.width * .07,
                                child: Image.asset(
                                  'assets/booking/assets/drive/equilizer.png',
                                  height:
                                  MediaQuery.of(context).size.height * .07,
                                  width:
                                  MediaQuery.of(context).size.width * .08,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 0.5,
                          width: Get.width * .4,
                        ),
                        const Text(
                          "or",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.normal),
                        ),
                        Container(
                          color: Colors.grey,
                          height: 0.5,
                          width: Get.width * .4,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //    FirebaseService().logCustomEvent();

                    InkWell(
                      onTap: () {
                      //  Get.toNamed(Routes.LISTINGMAP);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Find all listings near your area ",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textColorGreen,
                                fontWeight: FontWeight.bold),
                          ),
                          // Image.asset(
                          //   'assets/booking/assets/icons/mapblack.png',
                          //   height: MediaQuery.of(context).size.height *.04,
                          //   width: MediaQuery.of(context).size.width *.08,
                          //   color: AppColors.textColorGreen,
                          //
                          // ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Visibility(
                        visible: controller.districtArea.value.isNotEmpty ||
                            controller.districtName.value.isNotEmpty ||
                            controller.areaName.value.isNotEmpty ||
                            controller.shortStay.value != 0 ||
                            controller.searchGymInt.value != 0 ||
                            controller.searchPoolInt.value != 0 ||
                            controller.searchAcInt.value != 0 ||
                            controller.searchParkingInt.value != 0 ||
                            controller.searchWorkSpaceInt.value != 0 ||
                            controller.searchNightInt.value != 0 ||
                            controller.searchPetsInt.value != 0 ||
                            controller.searchAddiInt.value != 0,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                controller.districtName.value == ""
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      color: AppColors.jaygaWhite,
                                      border:
                                      Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .14,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "${controller.districtName.value}",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller.districtName
                                                  .value = "";
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                controller.areaName.value == ""
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      color: AppColors.jaygaWhite,
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .14,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "${controller.areaName.value}",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller.areaName.value =
                                              "";
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                controller.shortStay.value == 0
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      color: AppColors.jaygaWhite,
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .14,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "Short Stay",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller.shortStay.value =
                                              0;
                                              controller.searchShortStay
                                                  .value = false;
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                controller.searchGymInt.value == 0
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      color: AppColors.jaygaWhite,
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .14,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "Gym",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller
                                                  .searchGymInt.value = 0;
                                              controller.searchGym.value =
                                              false;
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                controller.searchPoolInt.value == 0
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      color: AppColors.jaygaWhite,
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .14,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "Pool",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller.searchPoolInt
                                                  .value = 0;
                                              controller.searchPool
                                                  .value = false;
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                controller.searchAcInt.value == 0
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      color: AppColors.jaygaWhite,
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .12,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "AC",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller
                                                  .searchAcInt.value = 0;
                                              controller.searchAc.value =
                                              false;
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                controller.searchParkingInt.value == 0
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      color: AppColors.jaygaWhite,
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .14,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "Parking",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller.searchParkingInt
                                                  .value = 0;
                                              controller.searchParking
                                                  .value = false;
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                controller.searchWorkSpaceInt.value == 0
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      color: AppColors.jaygaWhite,
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .14,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "WorkSpace",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller
                                                  .searchWorkSpaceInt
                                                  .value = 0;
                                              controller.searchWorkSpace
                                                  .value = false;
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                controller.searchNightInt.value == 0
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      color: AppColors.jaygaWhite,
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .15,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "Night Entry",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller.searchNightInt
                                                  .value = 0;
                                              controller.searchNightEntry
                                                  .value = false;
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                controller.searchPetsInt.value == 0
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      color: AppColors.jaygaWhite,
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .14,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "Pets",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller.searchPetsInt
                                                  .value = 0;
                                              controller.searchPets
                                                  .value = false;
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                controller.searchAddiInt.value == 0
                                    ? Container()
                                    : AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height:
                                  MediaQuery.of(context).size.width *
                                      .1,
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .25,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                      color: AppColors.jaygaWhite,
                                      borderRadius: BorderRadius.circular(
                                          controller.searchLoad.value == 1
                                              ? 60
                                              : 40)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .14,
                                          child: Text(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            "Guest",
                                            style: TextStyle(
                                              color: AppColors
                                                  .textColorBlack,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller.searchAddiInt
                                                  .value = 0;
                                              controller.searchAddiGuest
                                                  .value = false;
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: AppColors
                                                  .textColorGreen,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    //tab
                    DefaultTabController(
                      initialIndex: 0,
                      length: 5,
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .11,
                              width: MediaQuery.of(context).size.width * 1.2,
                              child: TabBar(
                                onTap: (i) {
                                  controller.tabIndex.value = i;
                                },
                                labelColor: Colors.black,
                                indicatorColor: AppColors.textColorGreen,
                                // indicator: BoxDecoration(
                                //   color: AppColors.textColorGreen, // Set the color for the entire tab
                                // ),
                                tabs: [
                                  Tab(
                                    icon: Image.asset(
                                      'assets/booking/assets/drive/room.png',
                                      color: Colors.black,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          .05,
                                      width: MediaQuery.of(context).size.width *
                                          .08,
                                    ),
                                    text: "Rooms",
                                  ),
                                  Tab(
                                    icon: Image.asset(
                                      'assets/booking/assets/drive/home.png',
                                      height:
                                      MediaQuery.of(context).size.height *
                                          .05,
                                      width: MediaQuery.of(context).size.width *
                                          .08,
                                    ),
                                    text: "Apartments",
                                  ),
                                  Tab(
                                    icon: Image.asset(
                                      'assets/booking/assets/drive/business.png',
                                      height:
                                      MediaQuery.of(context).size.height *
                                          .05,
                                      width: MediaQuery.of(context).size.width *
                                          .08,
                                    ),
                                    text: "Hotels",
                                  ),
                                  Tab(
                                    icon: Image.asset(
                                      'assets/booking/assets/drive/parking.png',
                                      height:
                                      MediaQuery.of(context).size.height *
                                          .05,
                                      width: MediaQuery.of(context).size.width *
                                          .08,
                                    ),
                                    text: "Parking",
                                  ),
                                  Tab(
                                    icon: Image.asset(
                                      'assets/booking/assets/icons/host/place_type/lounge.png',
                                      height:
                                      MediaQuery.of(context).size.height *
                                          .05,
                                      width: MediaQuery.of(context).size.width *
                                          .08,
                                    ),
                                    text: "Lounge",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          controller.filteredListingList.isEmpty
                              ? Center(
                            child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                  color: AppColors.textColorGreen,
                                )),
                          )
                              : SizedBox(
                            height:
                            MediaQuery.of(context).size.height * 14,
                            child: TabBarView(
                              children: [
                                Obx(() {
                                  return SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        10,
                                    child: ListView.builder(
                                      shrinkWrap: true,

                                      physics:
                                      const NeverScrollableScrollPhysics(), // new
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.searchString
                                          .value.isNotEmpty
                                          ? controller.filteredListingList
                                          .where((element) =>
                                      element.listingType ==
                                          "appartment" ||
                                          element.listingType ==
                                              "room" ||
                                          element.listingType ==
                                              "Flat" ||
                                          element.listingType ==
                                              "apartment" ||
                                          element.listingType ==
                                              "House")
                                          .length
                                          : controller
                                          .filteredListingListFromFilter
                                          .where((element) =>
                                      element.listingType ==
                                          "appartment" ||
                                          element.listingType ==
                                              "Flat" ||
                                          element.listingType ==
                                              "room" ||
                                          element.listingType ==
                                              "apartment" ||
                                          element.listingType ==
                                              "House")
                                          .length,

                                      itemBuilder:
                                          (BuildContext context, index) {
                                        var data = controller.searchString
                                            .value.isNotEmpty
                                            ? controller.filteredListingList
                                            .where((element) =>
                                        element.listingType ==
                                            "appartment" ||
                                            element.listingType ==
                                                "Flat" ||
                                            element.listingType ==
                                                "room" ||
                                            element.listingType ==
                                                "apartment" ||
                                            element.listingType ==
                                                "House")
                                            .toList()[index]
                                            : controller
                                            .filteredListingList
                                            .where((element) =>
                                        element.listingType ==
                                            "appartment" ||
                                            element.listingType ==
                                                "Flat" ||
                                            element.listingType ==
                                                "room" ||
                                            element.listingType ==
                                                "apartment" ||
                                            element.listingType ==
                                                "House")
                                            .toList()[index];

                                        bool isFavorite = controller
                                            .favListingData
                                            .any((favorite) =>
                                        favorite.listingId ==
                                            data.listingId);
                                        return Obx(() {
                                          return Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  InkWell(
                                                    onTap: () {


                                                      Get.toNamed(
                                                          Routes
                                                              .TOLETDETAILS,
                                                          arguments: [
                                                            data
                                                          ]);
                                                    },
                                                    child: Container(
                                                        height: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .height *
                                                            .32,
                                                        width: double
                                                            .infinity,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              20),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 2),
                                                          color: AppColors
                                                              .jaygaAppBackGroundWhite,
                                                        ),
                                                        child:
                                                        CarouselSlider(
                                                          options:
                                                          CarouselOptions(
                                                            onPageChanged:
                                                                (i, reason) {
                                                              controller
                                                                  .dataIndex
                                                                  .value = index;
                                                              controller
                                                                  .caruPage
                                                                  .value = i;
                                                            },
                                                            padEnds:
                                                            false,
                                                            viewportFraction:
                                                            1.0,
                                                            height: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .height *
                                                                .32,
                                                          ),
                                                          items: data
                                                              .images!
                                                              .map<Widget>(
                                                                  (i) {
                                                                print(
                                                                    "all images are ${data.images.length}");
                                                                return Builder(
                                                                  builder:
                                                                      (BuildContext
                                                                  context) {
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          color: Colors.transparent),
                                                                      child:
                                                                      CachedNetworkImage(
                                                                        //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                                        imageUrl:
                                                                        "https://new.jayga.io/uploads/listings/${i.listingFilename}",
                                                                        imageBuilder: (context, imageProvider) =>
                                                                            Container(
                                                                              width:
                                                                              double.infinity,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color: Colors.transparent,
                                                                                borderRadius: BorderRadius.circular(20),
                                                                                image: DecorationImage(
                                                                                  image: imageProvider,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        placeholder: (context, url) =>
                                                                        const Padding(
                                                                          padding:
                                                                          EdgeInsets.all(5.0),
                                                                          child:
                                                                          Image(
                                                                            image: AssetImage(
                                                                              'assets/booking/assets/images/jayga_logo.png',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        errorWidget: (context, url, error) =>
                                                                        const Padding(
                                                                          padding:
                                                                          EdgeInsets.all(5.0),
                                                                          child:
                                                                          Image(
                                                                            image: AssetImage(
                                                                              'assets/booking/assets/images/jayga_logo.png',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }).toList(),
                                                        )),
                                                  ),
                                                  Positioned(
                                                    bottom: 20,
                                                    left: 150,
                                                    child: Center(
                                                      child:
                                                      DotsIndicator(
                                                        dotsCount: data
                                                            .images
                                                            .isEmpty
                                                            ? 0
                                                            : data.images!
                                                            .length,
                                                        position: controller
                                                            .dataIndex
                                                            .value ==
                                                            index
                                                            ? controller
                                                            .caruPage
                                                            .value
                                                            : 0,
                                                        decorator:
                                                        DotsDecorator(
                                                          activeColor:
                                                          AppColors
                                                              .textColorGreen,
                                                          color: Colors
                                                              .white,
                                                          shape:
                                                          const CircleBorder(),
                                                          activeShape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  15.0)),
                                                          size:
                                                          const Size(
                                                              10, 10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 20,
                                                    top: 20,
                                                    child: InkWell(
                                                        onTap: () {

                                                        },
                                                        child: isFavorite ==
                                                            true
                                                            ? const Icon(
                                                          Icons
                                                              .favorite,
                                                          color: Colors
                                                              .red,
                                                        )
                                                            : const Icon(
                                                          Icons
                                                              .favorite_border,
                                                          color: Colors
                                                              .white,
                                                        )),
                                                  )
                                                ],
                                              ),

                                              const SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () {


                                                  Get.toNamed(
                                                      Routes
                                                          .TOLETDETAILS,
                                                      arguments: [data]);
                                                },
                                                child: Card(
                                                  color: AppColors
                                                      .jaygaAppBackGroundWhite,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            SizedBox(
                                                                height: MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                    .05,
                                                                child:
                                                                Text(
                                                                  data.listingTitle,
                                                                  maxLines:
                                                                  2,
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      fontSize: 18),
                                                                )),
                                                            Row(
                                                              children: [
                                                                const Image(
                                                                  image:
                                                                  AssetImage(
                                                                    'assets/booking/assets/icons/star.png',
                                                                  ),
                                                                ),

                                                                data.reviews
                                                                    .isEmpty
                                                                    ? const Text(
                                                                    "0.0")
                                                                    : Text(
                                                                    data.reviews!.first.avgRating!.contains(".") ? data.reviews!.first.avgRating!.substring(0, 3) : data.reviews!.first.avgRating!,
                                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        data
                                                            .allowShortStay == "1"?
                                                        Text("Short Stay Available") : Container(),
                                                        Text(data
                                                            .listingDescription),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              "${data.bedNum} Bedroom + ${data.bathroomNum}Patio + ${data.bathroomNum}BT",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize:
                                                                  12),
                                                            ),
                                                            Text(
                                                                "৳${data.fullDayPriceSetByUser} total",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize:
                                                                    16)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                      },
                                    ),
                                  );
                                }),
                                Obx(() {
                                  return SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        10,
                                    child: ListView.builder(
                                      shrinkWrap: true,

                                      physics:
                                      const NeverScrollableScrollPhysics(), // new
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.searchString
                                          .value.isNotEmpty
                                          ? controller.filteredListingList
                                          .where((element) =>
                                      element.listingType ==
                                          "appartment" ||
                                          element.listingType ==
                                              "room" ||
                                          element.listingType ==
                                              "Flat" ||
                                          element.listingType ==
                                              "apartment" ||
                                          element.listingType ==
                                              "House")
                                          .length
                                          : controller
                                          .filteredListingListFromFilter
                                          .where((element) =>
                                      element.listingType ==
                                          "appartment" ||
                                          element.listingType ==
                                              "Flat" ||
                                          element.listingType ==
                                              "room" ||
                                          element.listingType ==
                                              "apartment" ||
                                          element.listingType ==
                                              "House")
                                          .length,

                                      itemBuilder:
                                          (BuildContext context, index) {
                                        var data = controller.searchString
                                            .value.isNotEmpty
                                            ? controller.filteredListingList
                                            .where((element) =>
                                        element.listingType ==
                                            "appartment" ||
                                            element.listingType ==
                                                "Flat" ||
                                            element.listingType ==
                                                "room" ||
                                            element.listingType ==
                                                "apartment" ||
                                            element.listingType ==
                                                "House")
                                            .toList()[index]
                                            : controller
                                            .filteredListingList
                                            .where((element) =>
                                        element.listingType ==
                                            "appartment" ||
                                            element.listingType ==
                                                "Flat" ||
                                            element.listingType ==
                                                "room" ||
                                            element.listingType ==
                                                "apartment" ||
                                            element.listingType ==
                                                "House")
                                            .toList()[index];

                                        bool isFavorite = controller
                                            .favListingData
                                            .any((favorite) =>
                                        favorite.listingId ==
                                            data.listingId);
                                        return Obx(() {
                                          return Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  InkWell(
                                                    onTap: () {


                                                      Get.toNamed(
                                                          Routes
                                                              .TOLETDETAILS,
                                                          arguments: [
                                                            data
                                                          ]);
                                                    },
                                                    child: Container(
                                                        height: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .height *
                                                            .32,
                                                        width: double
                                                            .infinity,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              20),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 2),
                                                          color: AppColors
                                                              .jaygaAppBackGroundWhite,
                                                        ),
                                                        child:
                                                        CarouselSlider(
                                                          options:
                                                          CarouselOptions(
                                                            onPageChanged:
                                                                (i, reason) {
                                                              controller
                                                                  .dataIndex
                                                                  .value = index;
                                                              controller
                                                                  .caruPage
                                                                  .value = i;
                                                            },
                                                            padEnds:
                                                            false,
                                                            viewportFraction:
                                                            1.0,
                                                            height: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .height *
                                                                .32,
                                                          ),
                                                          items: data
                                                              .images!
                                                              .map<Widget>(
                                                                  (i) {
                                                                print(
                                                                    "all images are ${data.images.length}");
                                                                return Builder(
                                                                  builder:
                                                                      (BuildContext
                                                                  context) {
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          color: Colors.transparent),
                                                                      child:
                                                                      CachedNetworkImage(
                                                                        //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                                        imageUrl:
                                                                        "https://new.jayga.io/uploads/listings/${i.listingFilename}",
                                                                        imageBuilder: (context, imageProvider) =>
                                                                            Container(
                                                                              width:
                                                                              double.infinity,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color: Colors.transparent,
                                                                                borderRadius: BorderRadius.circular(20),
                                                                                image: DecorationImage(
                                                                                  image: imageProvider,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        placeholder: (context, url) =>
                                                                        const Padding(
                                                                          padding:
                                                                          EdgeInsets.all(5.0),
                                                                          child:
                                                                          Image(
                                                                            image: AssetImage(
                                                                              'assets/booking/assets/images/jayga_logo.png',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        errorWidget: (context, url, error) =>
                                                                        const Padding(
                                                                          padding:
                                                                          EdgeInsets.all(5.0),
                                                                          child:
                                                                          Image(
                                                                            image: AssetImage(
                                                                              'assets/booking/assets/images/jayga_logo.png',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }).toList(),
                                                        )),
                                                  ),
                                                  Positioned(
                                                    bottom: 20,
                                                    left: 150,
                                                    child: Center(
                                                      child:
                                                      DotsIndicator(
                                                        dotsCount: data
                                                            .images
                                                            .isEmpty
                                                            ? 0
                                                            : data.images!
                                                            .length,
                                                        position: controller
                                                            .dataIndex
                                                            .value ==
                                                            index
                                                            ? controller
                                                            .caruPage
                                                            .value
                                                            : 0,
                                                        decorator:
                                                        DotsDecorator(
                                                          activeColor:
                                                          AppColors
                                                              .textColorGreen,
                                                          color: Colors
                                                              .white,
                                                          shape:
                                                          const CircleBorder(),
                                                          activeShape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  15.0)),
                                                          size:
                                                          const Size(
                                                              10, 10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 20,
                                                    top: 20,
                                                    child: InkWell(
                                                        onTap: () {

                                                        },
                                                        child: isFavorite ==
                                                            true
                                                            ? const Icon(
                                                          Icons
                                                              .favorite,
                                                          color: Colors
                                                              .red,
                                                        )
                                                            : const Icon(
                                                          Icons
                                                              .favorite_border,
                                                          color: Colors
                                                              .white,
                                                        )),
                                                  )
                                                ],
                                              ),

                                              const SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () {


                                                  Get.toNamed(
                                                      Routes
                                                          .TOLETDETAILS,
                                                      arguments: [data]);
                                                },
                                                child: Card(
                                                  color: AppColors
                                                      .jaygaAppBackGroundWhite,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            SizedBox(
                                                                height: MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                    .05,
                                                                child:
                                                                Text(
                                                                  data.listingTitle,
                                                                  maxLines:
                                                                  2,
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      fontSize: 18),
                                                                )),
                                                            Row(
                                                              children: [
                                                                const Image(
                                                                  image:
                                                                  AssetImage(
                                                                    'assets/booking/assets/icons/star.png',
                                                                  ),
                                                                ),

                                                                data.reviews
                                                                    .isEmpty
                                                                    ? const Text(
                                                                    "0.0")
                                                                    : Text(
                                                                    data.reviews!.first.avgRating!.contains(".") ? data.reviews!.first.avgRating!.substring(0, 3) : data.reviews!.first.avgRating!,
                                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        data
                                                            .allowShortStay == "1"?
                                                        Text("Short Stay Available") : Container(),
                                                        Text(data
                                                            .listingDescription),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              "${data.bedNum} Bedroom + ${data.bathroomNum}Patio + ${data.bathroomNum}BT",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize:
                                                                  12),
                                                            ),
                                                            Text(
                                                                "৳${data.fullDayPriceSetByUser} total",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize:
                                                                    16)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                      },
                                    ),
                                  );
                                }),
                                Obx(() {
                                  return SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        10,
                                    child: ListView.builder(
                                      shrinkWrap: true,

                                      physics:
                                      const NeverScrollableScrollPhysics(), // new
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.searchString
                                          .value.isNotEmpty
                                          ? controller.filteredListingList
                                          .where((element) =>
                                      element.listingType ==
                                          "appartment" ||
                                          element.listingType ==
                                              "room" ||
                                          element.listingType ==
                                              "Flat" ||
                                          element.listingType ==
                                              "apartment" ||
                                          element.listingType ==
                                              "House")
                                          .length
                                          : controller
                                          .filteredListingListFromFilter
                                          .where((element) =>
                                      element.listingType ==
                                          "appartment" ||
                                          element.listingType ==
                                              "Flat" ||
                                          element.listingType ==
                                              "room" ||
                                          element.listingType ==
                                              "apartment" ||
                                          element.listingType ==
                                              "House")
                                          .length,

                                      itemBuilder:
                                          (BuildContext context, index) {
                                        var data = controller.searchString
                                            .value.isNotEmpty
                                            ? controller.filteredListingList
                                            .where((element) =>
                                        element.listingType ==
                                            "appartment" ||
                                            element.listingType ==
                                                "Flat" ||
                                            element.listingType ==
                                                "room" ||
                                            element.listingType ==
                                                "apartment" ||
                                            element.listingType ==
                                                "House")
                                            .toList()[index]
                                            : controller
                                            .filteredListingList
                                            .where((element) =>
                                        element.listingType ==
                                            "appartment" ||
                                            element.listingType ==
                                                "Flat" ||
                                            element.listingType ==
                                                "room" ||
                                            element.listingType ==
                                                "apartment" ||
                                            element.listingType ==
                                                "House")
                                            .toList()[index];

                                        bool isFavorite = controller
                                            .favListingData
                                            .any((favorite) =>
                                        favorite.listingId ==
                                            data.listingId);
                                        return Obx(() {
                                          return Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  InkWell(
                                                    onTap: () {


                                                      Get.toNamed(
                                                          Routes
                                                              .TOLETDETAILS,
                                                          arguments: [
                                                            data
                                                          ]);
                                                    },
                                                    child: Container(
                                                        height: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .height *
                                                            .32,
                                                        width: double
                                                            .infinity,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              20),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 2),
                                                          color: AppColors
                                                              .jaygaAppBackGroundWhite,
                                                        ),
                                                        child:
                                                        CarouselSlider(
                                                          options:
                                                          CarouselOptions(
                                                            onPageChanged:
                                                                (i, reason) {
                                                              controller
                                                                  .dataIndex
                                                                  .value = index;
                                                              controller
                                                                  .caruPage
                                                                  .value = i;
                                                            },
                                                            padEnds:
                                                            false,
                                                            viewportFraction:
                                                            1.0,
                                                            height: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .height *
                                                                .32,
                                                          ),
                                                          items: data
                                                              .images!
                                                              .map<Widget>(
                                                                  (i) {
                                                                print(
                                                                    "all images are ${data.images.length}");
                                                                return Builder(
                                                                  builder:
                                                                      (BuildContext
                                                                  context) {
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          color: Colors.transparent),
                                                                      child:
                                                                      CachedNetworkImage(
                                                                        //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                                        imageUrl:
                                                                        "https://new.jayga.io/uploads/listings/${i.listingFilename}",
                                                                        imageBuilder: (context, imageProvider) =>
                                                                            Container(
                                                                              width:
                                                                              double.infinity,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color: Colors.transparent,
                                                                                borderRadius: BorderRadius.circular(20),
                                                                                image: DecorationImage(
                                                                                  image: imageProvider,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        placeholder: (context, url) =>
                                                                        const Padding(
                                                                          padding:
                                                                          EdgeInsets.all(5.0),
                                                                          child:
                                                                          Image(
                                                                            image: AssetImage(
                                                                              'assets/booking/assets/images/jayga_logo.png',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        errorWidget: (context, url, error) =>
                                                                        const Padding(
                                                                          padding:
                                                                          EdgeInsets.all(5.0),
                                                                          child:
                                                                          Image(
                                                                            image: AssetImage(
                                                                              'assets/booking/assets/images/jayga_logo.png',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }).toList(),
                                                        )),
                                                  ),
                                                  Positioned(
                                                    bottom: 20,
                                                    left: 150,
                                                    child: Center(
                                                      child:
                                                      DotsIndicator(
                                                        dotsCount: data
                                                            .images
                                                            .isEmpty
                                                            ? 0
                                                            : data.images!
                                                            .length,
                                                        position: controller
                                                            .dataIndex
                                                            .value ==
                                                            index
                                                            ? controller
                                                            .caruPage
                                                            .value
                                                            : 0,
                                                        decorator:
                                                        DotsDecorator(
                                                          activeColor:
                                                          AppColors
                                                              .textColorGreen,
                                                          color: Colors
                                                              .white,
                                                          shape:
                                                          const CircleBorder(),
                                                          activeShape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  15.0)),
                                                          size:
                                                          const Size(
                                                              10, 10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 20,
                                                    top: 20,
                                                    child: InkWell(
                                                        onTap: () {

                                                        },
                                                        child: isFavorite ==
                                                            true
                                                            ? const Icon(
                                                          Icons
                                                              .favorite,
                                                          color: Colors
                                                              .red,
                                                        )
                                                            : const Icon(
                                                          Icons
                                                              .favorite_border,
                                                          color: Colors
                                                              .white,
                                                        )),
                                                  )
                                                ],
                                              ),

                                              const SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () {


                                                  Get.toNamed(
                                                      Routes
                                                          .TOLETDETAILS,
                                                      arguments: [data]);
                                                },
                                                child: Card(
                                                  color: AppColors
                                                      .jaygaAppBackGroundWhite,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            SizedBox(
                                                                height: MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                    .05,
                                                                child:
                                                                Text(
                                                                  data.listingTitle,
                                                                  maxLines:
                                                                  2,
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      fontSize: 18),
                                                                )),
                                                            Row(
                                                              children: [
                                                                const Image(
                                                                  image:
                                                                  AssetImage(
                                                                    'assets/booking/assets/icons/star.png',
                                                                  ),
                                                                ),

                                                                data.reviews
                                                                    .isEmpty
                                                                    ? const Text(
                                                                    "0.0")
                                                                    : Text(
                                                                    data.reviews!.first.avgRating!.contains(".") ? data.reviews!.first.avgRating!.substring(0, 3) : data.reviews!.first.avgRating!,
                                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        data
                                                            .allowShortStay == "1"?
                                                        Text("Short Stay Available") : Container(),
                                                        Text(data
                                                            .listingDescription),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              "${data.bedNum} Bedroom + ${data.bathroomNum}Patio + ${data.bathroomNum}BT",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize:
                                                                  12),
                                                            ),
                                                            Text(
                                                                "৳${data.fullDayPriceSetByUser} total",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize:
                                                                    16)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                      },
                                    ),
                                  );
                                }),
                                Obx(() {
                                  return SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        10,
                                    child: ListView.builder(
                                      shrinkWrap: true,

                                      physics:
                                      const NeverScrollableScrollPhysics(), // new
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.searchString
                                          .value.isNotEmpty
                                          ? controller.filteredListingList
                                          .where((element) =>
                                      element.listingType ==
                                          "appartment" ||
                                          element.listingType ==
                                              "room" ||
                                          element.listingType ==
                                              "Flat" ||
                                          element.listingType ==
                                              "apartment" ||
                                          element.listingType ==
                                              "House")
                                          .length
                                          : controller
                                          .filteredListingListFromFilter
                                          .where((element) =>
                                      element.listingType ==
                                          "appartment" ||
                                          element.listingType ==
                                              "Flat" ||
                                          element.listingType ==
                                              "room" ||
                                          element.listingType ==
                                              "apartment" ||
                                          element.listingType ==
                                              "House")
                                          .length,

                                      itemBuilder:
                                          (BuildContext context, index) {
                                        var data = controller.searchString
                                            .value.isNotEmpty
                                            ? controller.filteredListingList
                                            .where((element) =>
                                        element.listingType ==
                                            "appartment" ||
                                            element.listingType ==
                                                "Flat" ||
                                            element.listingType ==
                                                "room" ||
                                            element.listingType ==
                                                "apartment" ||
                                            element.listingType ==
                                                "House")
                                            .toList()[index]
                                            : controller
                                            .filteredListingList
                                            .where((element) =>
                                        element.listingType ==
                                            "appartment" ||
                                            element.listingType ==
                                                "Flat" ||
                                            element.listingType ==
                                                "room" ||
                                            element.listingType ==
                                                "apartment" ||
                                            element.listingType ==
                                                "House")
                                            .toList()[index];

                                        bool isFavorite = controller
                                            .favListingData
                                            .any((favorite) =>
                                        favorite.listingId ==
                                            data.listingId);
                                        return Obx(() {
                                          return Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  InkWell(
                                                    onTap: () {


                                                      Get.toNamed(
                                                          Routes
                                                              .TOLETDETAILS,
                                                          arguments: [
                                                            data
                                                          ]);
                                                    },
                                                    child: Container(
                                                        height: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .height *
                                                            .32,
                                                        width: double
                                                            .infinity,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              20),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 2),
                                                          color: AppColors
                                                              .jaygaAppBackGroundWhite,
                                                        ),
                                                        child:
                                                        CarouselSlider(
                                                          options:
                                                          CarouselOptions(
                                                            onPageChanged:
                                                                (i, reason) {
                                                              controller
                                                                  .dataIndex
                                                                  .value = index;
                                                              controller
                                                                  .caruPage
                                                                  .value = i;
                                                            },
                                                            padEnds:
                                                            false,
                                                            viewportFraction:
                                                            1.0,
                                                            height: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .height *
                                                                .32,
                                                          ),
                                                          items: data
                                                              .images!
                                                              .map<Widget>(
                                                                  (i) {
                                                                print(
                                                                    "all images are ${data.images.length}");
                                                                return Builder(
                                                                  builder:
                                                                      (BuildContext
                                                                  context) {
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          color: Colors.transparent),
                                                                      child:
                                                                      CachedNetworkImage(
                                                                        //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                                        imageUrl:
                                                                        "https://new.jayga.io/uploads/listings/${i.listingFilename}",
                                                                        imageBuilder: (context, imageProvider) =>
                                                                            Container(
                                                                              width:
                                                                              double.infinity,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color: Colors.transparent,
                                                                                borderRadius: BorderRadius.circular(20),
                                                                                image: DecorationImage(
                                                                                  image: imageProvider,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        placeholder: (context, url) =>
                                                                        const Padding(
                                                                          padding:
                                                                          EdgeInsets.all(5.0),
                                                                          child:
                                                                          Image(
                                                                            image: AssetImage(
                                                                              'assets/booking/assets/images/jayga_logo.png',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        errorWidget: (context, url, error) =>
                                                                        const Padding(
                                                                          padding:
                                                                          EdgeInsets.all(5.0),
                                                                          child:
                                                                          Image(
                                                                            image: AssetImage(
                                                                              'assets/booking/assets/images/jayga_logo.png',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }).toList(),
                                                        )),
                                                  ),
                                                  Positioned(
                                                    bottom: 20,
                                                    left: 150,
                                                    child: Center(
                                                      child:
                                                      DotsIndicator(
                                                        dotsCount: data
                                                            .images
                                                            .isEmpty
                                                            ? 0
                                                            : data.images!
                                                            .length,
                                                        position: controller
                                                            .dataIndex
                                                            .value ==
                                                            index
                                                            ? controller
                                                            .caruPage
                                                            .value
                                                            : 0,
                                                        decorator:
                                                        DotsDecorator(
                                                          activeColor:
                                                          AppColors
                                                              .textColorGreen,
                                                          color: Colors
                                                              .white,
                                                          shape:
                                                          const CircleBorder(),
                                                          activeShape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  15.0)),
                                                          size:
                                                          const Size(
                                                              10, 10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 20,
                                                    top: 20,
                                                    child: InkWell(
                                                        onTap: () {

                                                        },
                                                        child: isFavorite ==
                                                            true
                                                            ? const Icon(
                                                          Icons
                                                              .favorite,
                                                          color: Colors
                                                              .red,
                                                        )
                                                            : const Icon(
                                                          Icons
                                                              .favorite_border,
                                                          color: Colors
                                                              .white,
                                                        )),
                                                  )
                                                ],
                                              ),

                                              const SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () {


                                                  Get.toNamed(
                                                      Routes
                                                          .TOLETDETAILS,
                                                      arguments: [data]);
                                                },
                                                child: Card(
                                                  color: AppColors
                                                      .jaygaAppBackGroundWhite,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            SizedBox(
                                                                height: MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                    .05,
                                                                child:
                                                                Text(
                                                                  data.listingTitle,
                                                                  maxLines:
                                                                  2,
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      fontSize: 18),
                                                                )),
                                                            Row(
                                                              children: [
                                                                const Image(
                                                                  image:
                                                                  AssetImage(
                                                                    'assets/booking/assets/icons/star.png',
                                                                  ),
                                                                ),

                                                                data.reviews
                                                                    .isEmpty
                                                                    ? const Text(
                                                                    "0.0")
                                                                    : Text(
                                                                    data.reviews!.first.avgRating!.contains(".") ? data.reviews!.first.avgRating!.substring(0, 3) : data.reviews!.first.avgRating!,
                                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        data
                                                            .allowShortStay == "1"?
                                                        Text("Short Stay Available") : Container(),
                                                        Text(data
                                                            .listingDescription),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              "${data.bedNum} Bedroom + ${data.bathroomNum}Patio + ${data.bathroomNum}BT",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize:
                                                                  12),
                                                            ),
                                                            Text(
                                                                "৳${data.fullDayPriceSetByUser} total",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize:
                                                                    16)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                      },
                                    ),
                                  );
                                }),
                                Obx(() {
                                  return SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        10,
                                    child: ListView.builder(
                                      shrinkWrap: true,

                                      physics:
                                      const NeverScrollableScrollPhysics(), // new
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.searchString
                                          .value.isNotEmpty
                                          ? controller.filteredListingList
                                          .where((element) =>
                                      element.listingType ==
                                          "appartment" ||
                                          element.listingType ==
                                              "room" ||
                                          element.listingType ==
                                              "Flat" ||
                                          element.listingType ==
                                              "apartment" ||
                                          element.listingType ==
                                              "House")
                                          .length
                                          : controller
                                          .filteredListingListFromFilter
                                          .where((element) =>
                                      element.listingType ==
                                          "appartment" ||
                                          element.listingType ==
                                              "Flat" ||
                                          element.listingType ==
                                              "room" ||
                                          element.listingType ==
                                              "apartment" ||
                                          element.listingType ==
                                              "House")
                                          .length,

                                      itemBuilder:
                                          (BuildContext context, index) {
                                        var data = controller.searchString
                                            .value.isNotEmpty
                                            ? controller.filteredListingList
                                            .where((element) =>
                                        element.listingType ==
                                            "appartment" ||
                                            element.listingType ==
                                                "Flat" ||
                                            element.listingType ==
                                                "room" ||
                                            element.listingType ==
                                                "apartment" ||
                                            element.listingType ==
                                                "House")
                                            .toList()[index]
                                            : controller
                                            .filteredListingList
                                            .where((element) =>
                                        element.listingType ==
                                            "appartment" ||
                                            element.listingType ==
                                                "Flat" ||
                                            element.listingType ==
                                                "room" ||
                                            element.listingType ==
                                                "apartment" ||
                                            element.listingType ==
                                                "House")
                                            .toList()[index];

                                        bool isFavorite = controller
                                            .favListingData
                                            .any((favorite) =>
                                        favorite.listingId ==
                                            data.listingId);
                                        return Obx(() {
                                          return Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  InkWell(
                                                    onTap: () {


                                                      Get.toNamed(
                                                          Routes
                                                              .TOLETDETAILS,
                                                          arguments: [
                                                            data
                                                          ]);
                                                    },
                                                    child: Container(
                                                        height: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .height *
                                                            .32,
                                                        width: double
                                                            .infinity,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              20),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 2),
                                                          color: AppColors
                                                              .jaygaAppBackGroundWhite,
                                                        ),
                                                        child:
                                                        CarouselSlider(
                                                          options:
                                                          CarouselOptions(
                                                            onPageChanged:
                                                                (i, reason) {
                                                              controller
                                                                  .dataIndex
                                                                  .value = index;
                                                              controller
                                                                  .caruPage
                                                                  .value = i;
                                                            },
                                                            padEnds:
                                                            false,
                                                            viewportFraction:
                                                            1.0,
                                                            height: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .height *
                                                                .32,
                                                          ),
                                                          items: data
                                                              .images!
                                                              .map<Widget>(
                                                                  (i) {
                                                                print(
                                                                    "all images are ${data.images.length}");
                                                                return Builder(
                                                                  builder:
                                                                      (BuildContext
                                                                  context) {
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          color: Colors.transparent),
                                                                      child:
                                                                      CachedNetworkImage(
                                                                        //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                                        imageUrl:
                                                                        "https://new.jayga.io/uploads/listings/${i.listingFilename}",
                                                                        imageBuilder: (context, imageProvider) =>
                                                                            Container(
                                                                              width:
                                                                              double.infinity,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color: Colors.transparent,
                                                                                borderRadius: BorderRadius.circular(20),
                                                                                image: DecorationImage(
                                                                                  image: imageProvider,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        placeholder: (context, url) =>
                                                                        const Padding(
                                                                          padding:
                                                                          EdgeInsets.all(5.0),
                                                                          child:
                                                                          Image(
                                                                            image: AssetImage(
                                                                              'assets/booking/assets/images/jayga_logo.png',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        errorWidget: (context, url, error) =>
                                                                        const Padding(
                                                                          padding:
                                                                          EdgeInsets.all(5.0),
                                                                          child:
                                                                          Image(
                                                                            image: AssetImage(
                                                                              'assets/booking/assets/images/jayga_logo.png',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }).toList(),
                                                        )),
                                                  ),
                                                  Positioned(
                                                    bottom: 20,
                                                    left: 150,
                                                    child: Center(
                                                      child:
                                                      DotsIndicator(
                                                        dotsCount: data
                                                            .images
                                                            .isEmpty
                                                            ? 0
                                                            : data.images!
                                                            .length,
                                                        position: controller
                                                            .dataIndex
                                                            .value ==
                                                            index
                                                            ? controller
                                                            .caruPage
                                                            .value
                                                            : 0,
                                                        decorator:
                                                        DotsDecorator(
                                                          activeColor:
                                                          AppColors
                                                              .textColorGreen,
                                                          color: Colors
                                                              .white,
                                                          shape:
                                                          const CircleBorder(),
                                                          activeShape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  15.0)),
                                                          size:
                                                          const Size(
                                                              10, 10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 20,
                                                    top: 20,
                                                    child: InkWell(
                                                        onTap: () {

                                                        },
                                                        child: isFavorite ==
                                                            true
                                                            ? const Icon(
                                                          Icons
                                                              .favorite,
                                                          color: Colors
                                                              .red,
                                                        )
                                                            : const Icon(
                                                          Icons
                                                              .favorite_border,
                                                          color: Colors
                                                              .white,
                                                        )),
                                                  )
                                                ],
                                              ),

                                              const SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () {


                                                  Get.toNamed(
                                                      Routes
                                                          .TOLETDETAILS,
                                                      arguments: [data]);
                                                },
                                                child: Card(
                                                  color: AppColors
                                                      .jaygaAppBackGroundWhite,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            SizedBox(
                                                                height: MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                    .05,
                                                                child:
                                                                Text(
                                                                  data.listingTitle,
                                                                  maxLines:
                                                                  2,
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      fontSize: 18),
                                                                )),
                                                            Row(
                                                              children: [
                                                                const Image(
                                                                  image:
                                                                  AssetImage(
                                                                    'assets/booking/assets/icons/star.png',
                                                                  ),
                                                                ),

                                                                data.reviews
                                                                    .isEmpty
                                                                    ? const Text(
                                                                    "0.0")
                                                                    : Text(
                                                                    data.reviews!.first.avgRating!.contains(".") ? data.reviews!.first.avgRating!.substring(0, 3) : data.reviews!.first.avgRating!,
                                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        data
                                                            .allowShortStay == "1"?
                                                        Text("Short Stay Available") : Container(),
                                                        Text(data
                                                            .listingDescription),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              "${data.bedNum} Bedroom + ${data.bathroomNum}Patio + ${data.bathroomNum}BT",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize:
                                                                  12),
                                                            ),
                                                            Text(
                                                                "৳${data.fullDayPriceSetByUser} total",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize:
                                                                    16)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                      },
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _handleScrollEnd() {
    // Implement your logic to handle scrolling end
    print('ListView scrolled to the end');
  }
}
