import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cityproject/app/module/feature/tolet/controller/tolet_controller.dart';
import 'package:cityproject/app/repositories/listing_rep.dart';
import 'package:cityproject/app/routes/app_pages.dart';
import 'package:cityproject/common/Color.dart';
import 'package:cityproject/common/custom_widget/booking_page_custom_shape.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';




class ToletDetailsView extends GetView<ToletController> {
  const ToletDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments[0];

    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(seconds: 2),
        height: Get.height * .08,
        width: MediaQuery.of(context).size.width - 100,
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(children: [
                TextSpan(
                  text: "${data.fullDayPriceSetByUser}৳",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const TextSpan(
                  text: "/Night",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: Get.height * .05,
              width: Get.width * .35,
              child: ElevatedButton(
                onPressed: () {
                 // Get.toNamed(Routes.CONFIEMANDPAY, arguments: [data]);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.textColorGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Book Now",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            // AnimatedContainer(
            //   duration: const Duration(seconds: 2),
            //   height: Get.height * .05,
            //   width: Get.width * .3,
            //   decoration: BoxDecoration(
            //       color: AppColors.textColorGreen,
            //       borderRadius: BorderRadius.circular(20)),
            //   alignment: Alignment.center,
            //   child: Text(
            //     "Book Now",
            //     style: TextStyle(
            //         color: AppColors.jaygaWhite,
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(Routes.HOME);
          return true;
        },
        child: SingleChildScrollView(
          child: Obx(() {
            return  Container(
              color: AppColors.jaygaAppBackGroundWhite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CustomClipShapeWidgets(
                    child: Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              controller.caruPage.value = index;
                            },
                            padEnds: false,
                            viewportFraction: 1.0,
                            height:
                            MediaQuery.of(context).size.height * .32,
                          ),
                          items: data.images!.map<Widget>((i) {
                            print("all images are ${data.images.length}");
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent),
                                  child: CachedNetworkImage(
                                    //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                    imageUrl:
                                    "https://new.jayga.io/uploads/listings/${i.listingFilename}",
                                    imageBuilder:
                                        (context, imageProvider) =>
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                            BorderRadius.circular(0),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    placeholder: (context, url) =>
                                    const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Image(
                                        image: AssetImage(
                                          'assets/booking/assets/images/jayga_logo.png',
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                    const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Image(
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
                        ),
                        Positioned(
                          bottom: 20,
                          left: 150,
                          child: Center(
                            child: DotsIndicator(
                              dotsCount: data.images!.length,
                              position: controller.caruPage.value,
                              decorator: DotsDecorator(
                                activeColor: AppColors.textColorGreen,
                                color: Colors.white,
                                shape: const CircleBorder(),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(15.0)),
                                size: const Size(10, 10),
                              ),
                            ),
                          ),
                        ),
                        // AppBar(
                        //   backgroundColor: Colors.transparent,
                        //   elevation: 0,
                        //   leading: IconButton(
                        //     icon: const Icon(
                        //       Icons.arrow_back_ios,
                        //       color: Colors.black,
                        //     ),
                        //     onPressed: () {
                        //       Get.back();
                        //     },
                        //   ),
                        //   actions: [
                        //     IconButton(
                        //       onPressed: () {},
                        //       icon: const Icon(
                        //           Icons.favorite_border_outlined),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    .55,
                                height: Get.height * .07,
                                child: Text(
                                  "${data.listingTitle}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColorBlack),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    .32,
                                height: Get.height * .07,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text:
                                          "${data.fullDayPriceSetByUser}tk ",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: "/Night",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text("4"),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // controller.selectReview.value = true;
                                            // Get.to(ReviewListView(),
                                            //     arguments: [data]);
                                          },
                                          child: Text(
                                            "(${controller.getReview.value.length} reviews)",
                                            style: const TextStyle(
                                                fontWeight:
                                                FontWeight.normal,
                                                fontSize: 14,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    .55,
                                child: Text(
                                  "${data.listingAddress}, ${data.town},${data.district}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.textColorBlack),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    .3,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: Get.height * .03,
                                          width: Get.width * .04,
                                          child: const Image(
                                            image: AssetImage(
                                              'assets/booking/assets/icons/bedicon.png',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${data.bedNum.toString()} Bedroom",
                                          style: const TextStyle(
                                              fontWeight:
                                              FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: Get.height * .03,
                                          width: Get.width * .04,
                                          child: const Image(
                                            image: AssetImage(
                                              'assets/booking/assets/icons/bath.png',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${data.bathroomNum.toString()} Bathroom",
                                          style: const TextStyle(
                                              fontWeight:
                                              FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       height: Get.height * .03,
                                    //       width: Get.width * .05,
                                    //       child: Image(
                                    //         image: AssetImage(
                                    //           'assets/booking/assets/icons/host/restriction/unknwn_guest.png',
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       width: 10,
                                    //     ),
                                    //     Text(
                                    //       "${data.bathroomNum.toString()} Max Guest",
                                    //       style: TextStyle(
                                    //           fontWeight:
                                    //           FontWeight.normal,
                                    //           fontSize: 15,
                                    //           color: Colors.black),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                child: const Text(
                                  maxLines: 2,
                                  "Description",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                              ),
                              InkWell(
                                onTap: () {

                                },
                                child: AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height: 20,
                                  width: Get.width * .27,
                                  decoration: BoxDecoration(
                                      color: data.videoLink == "no"
                                          ? Colors.grey
                                          : AppColors.textColorGreen,
                                      borderRadius:
                                      BorderRadius.circular(50)),
                                  alignment: Alignment.center,
                                  child: controller.seeVideo.value == true
                                      ? Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceAround,
                                    children: [
                                      const Icon(
                                        Icons.video_call,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      Text(
                                        "See Video",
                                        style: TextStyle(
                                          color: AppColors
                                              .backgroundColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  )
                                      : Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceAround,
                                    children: [
                                      const Icon(
                                        Icons.video_call,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      Text(
                                        "See Video",
                                        style: TextStyle(
                                          color: AppColors
                                              .backgroundColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // controller.seeVideo.value == true
                          //     ? Column(
                          //         children: [
                          //           Center(
                          //             child: AspectRatio(
                          //               aspectRatio: controller
                          //                   .videoController
                          //                   .value
                          //                   .aspectRatio,
                          //               child: VideoPlayer(
                          //                   controller.videoController),
                          //             ),
                          //           ),
                          //           InkWell(
                          //               onTap: () {
                          //                 if (controller.videoController
                          //                     .value.isPlaying) {
                          //                   controller.videoController
                          //                       .pause();
                          //                   print("video pause");
                          //                 } else {
                          //                   controller.videoController
                          //                       .play();
                          //                   print("video play");
                          //                 }
                          //               },
                          //               child: controller.videoController
                          //                       .value.isPlaying
                          //                   ? Icon(
                          //                       Icons.pause,
                          //                       size: 30,
                          //                     )
                          //                   : Icon(
                          //                       Icons.play_arrow_outlined,
                          //                       size: 30,
                          //                     ))
                          //         ],
                          //       )
                          //     : Container(),
                          const SizedBox(
                            height: 5,
                          ),

                          Text(
                            data.listingDescription,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.black54),
                          ),

                          // Divider(),
                          // data.allowShortStay == "0"
                          //     ? Text(
                          //         "Short Stay is not available for this place",
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.normal,
                          //             fontSize: 15,
                          //             color: AppColors.redButton),
                          //       )
                          //     : Text(
                          //         "Short Stay is available for this place",
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.normal,
                          //             fontSize: 15,
                          //             color: Colors.black),
                          //       ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Amenities",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: AppColors.textColorBlack),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.seeAmenities.value = true;
                                },
                                child: Text(
                                  "See All Amenities",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: AppColors.textColorGreen),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  "1" == "0"
                                  // controller.listingDatawifi.value == "0"
                                      ? Container()
                                      : AnimatedContainer(
                                    duration:
                                    const Duration(seconds: 2),
                                    height: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .08,
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .29,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        color: AppColors
                                            .textColorGreen,
                                        borderRadius: BorderRadius
                                            .circular(controller
                                            .searchLoad
                                            .value ==
                                            1
                                            ? 5
                                            : 5)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Container(
                                            height:
                                            Get.height * .02,
                                            width: Get.width * .03,
                                            child: const Image(
                                              color: Colors.white,
                                              image: AssetImage(
                                                'assets/booking/assets/icons/host/place_offer/wifi.png',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(
                                                context)
                                                .size
                                                .width *
                                                .2,
                                            child: const Text(
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              "Wifi",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  "1" == "0"
                                  //  controller.listingDatacctv.value == "0"
                                      ? Container()
                                      : AnimatedContainer(
                                    duration:
                                    const Duration(seconds: 2),
                                    height: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .08,
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .29,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        color: AppColors
                                            .textColorGreen,
                                        borderRadius: BorderRadius
                                            .circular(controller
                                            .searchLoad
                                            .value ==
                                            1
                                            ? 5
                                            : 5)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Container(
                                            height:
                                            Get.height * .02,
                                            width: Get.width * .03,
                                            child: const Image(
                                              color: Colors.white,
                                              image: AssetImage(
                                                'assets/booking/assets/icons/host/place_offer/cctv.png',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(
                                                context)
                                                .size
                                                .width *
                                                .2,
                                            child: const Text(
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              "CCTV surveillance",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  "1" == "0"
                                      ? Container()
                                      : AnimatedContainer(
                                    duration:
                                    const Duration(seconds: 2),
                                    height: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .08,
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .29,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        color: AppColors
                                            .textColorGreen,
                                        borderRadius: BorderRadius
                                            .circular(controller
                                            .searchLoad
                                            .value ==
                                            1
                                            ? 5
                                            : 5)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Container(
                                            height:
                                            Get.height * .02,
                                            width: Get.width * .03,
                                            child: const Image(
                                              color: Colors.white,
                                              image: AssetImage(
                                                'assets/booking/assets/icons/bedicon.png',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(
                                                context)
                                                .size
                                                .width *
                                                .2,
                                            child: const Text(
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              "24/7 Security",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   height: 70,
                                  //   width: 60,
                                  //   decoration: BoxDecoration(
                                  //     color: AppColors.textColorWhite,
                                  //     borderRadius: BorderRadius.circular(20),
                                  //     border: Border.all(
                                  //         color: AppColors.textColorGreen,
                                  //         width: 2),
                                  //   ),
                                  //   child: Column(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.center,
                                  //     //crossAxisAlignment: CrossAxisAlignment.center,
                                  //     children: [
                                  //       Image.asset(
                                  //         "assets/booking/assets/icons/single_room.png",
                                  //         color: AppColors.textColorGreen,
                                  //         height: 20,
                                  //         width: 20,
                                  //       ),
                                  //       Center(
                                  //         child: Container(
                                  //           height: 30,
                                  //           width: 50,
                                  //           child: Center(
                                  //             child: Text(
                                  //               "Single Room",
                                  //               maxLines: 2,
                                  //               style: TextStyle(
                                  //                   fontWeight:
                                  //                       FontWeight.normal,
                                  //                   fontSize: 12,
                                  //                   color: AppColors
                                  //                       .textColorGreen),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      "1" == "0"
                                      //  controller.listingDatacctv.value == "0"
                                          ? Container()
                                          : AnimatedContainer(
                                        duration: const Duration(
                                            seconds: 2),
                                        height:
                                        MediaQuery.of(context)
                                            .size
                                            .width *
                                            .08,
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width *
                                            .29,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey),
                                            color: AppColors
                                                .textColorGreen,
                                            borderRadius: BorderRadius
                                                .circular(controller
                                                .searchLoad
                                                .value ==
                                                1
                                                ? 5
                                                : 5)),
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(
                                                height: Get.height *
                                                    .02,
                                                width:
                                                Get.width * .03,
                                                child: const Image(
                                                  color:
                                                  Colors.white,
                                                  image: AssetImage(
                                                    'assets/booking/assets/icons/bedicon.png',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(
                                                    context)
                                                    .size
                                                    .width *
                                                    .2,
                                                child: const Text(
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                  "Spaced Gate",
                                                  style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      controller.listingDatacctv.value ==
                                          "0"
                                          ? Container()
                                          : AnimatedContainer(
                                        duration: const Duration(
                                            seconds: 2),
                                        height:
                                        MediaQuery.of(context)
                                            .size
                                            .width *
                                            .08,
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width *
                                            .29,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey),
                                            color: AppColors
                                                .textColorGreen,
                                            borderRadius: BorderRadius
                                                .circular(controller
                                                .searchLoad
                                                .value ==
                                                1
                                                ? 5
                                                : 5)),
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(
                                                height: Get.height *
                                                    .02,
                                                width:
                                                Get.width * .03,
                                                child: const Image(
                                                  color:
                                                  Colors.white,
                                                  image: AssetImage(
                                                    'assets/booking/assets/icons/host/place_offer/fire_ext.png',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(
                                                    context)
                                                    .size
                                                    .width *
                                                    .2,
                                                child: const Text(
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                  "Fire Exit",
                                                  style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      controller.listingDatacctv.value ==
                                          "0"
                                          ? Container()
                                          : AnimatedContainer(
                                        duration: const Duration(
                                            seconds: 2),
                                        height:
                                        MediaQuery.of(context)
                                            .size
                                            .width *
                                            .08,
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width *
                                            .29,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey),
                                            color: AppColors
                                                .textColorGreen,
                                            borderRadius: BorderRadius
                                                .circular(controller
                                                .searchLoad
                                                .value ==
                                                1
                                                ? 5
                                                : 5)),
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(
                                                height: Get.height *
                                                    .02,
                                                width:
                                                Get.width * .03,
                                                child: const Image(
                                                  color:
                                                  Colors.white,
                                                  image: AssetImage(
                                                    'assets/booking/assets/icons/host/place_offer/ac.png',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(
                                                    context)
                                                    .size
                                                    .width *
                                                    .2,
                                                child: const Text(
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                  "Air Conditioned",
                                                  style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //   height: 70,
                                      //   width: 60,
                                      //   decoration: BoxDecoration(
                                      //     color: AppColors.textColorWhite,
                                      //     borderRadius: BorderRadius.circular(20),
                                      //     border: Border.all(
                                      //         color: AppColors.textColorGreen,
                                      //         width: 2),
                                      //   ),
                                      //   child: Column(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.center,
                                      //     //crossAxisAlignment: CrossAxisAlignment.center,
                                      //     children: [
                                      //       Image.asset(
                                      //         "assets/booking/assets/icons/single_room.png",
                                      //         color: AppColors.textColorGreen,
                                      //         height: 20,
                                      //         width: 20,
                                      //       ),
                                      //       Center(
                                      //         child: Container(
                                      //           height: 30,
                                      //           width: 50,
                                      //           child: Center(
                                      //             child: Text(
                                      //               "Single Room",
                                      //               maxLines: 2,
                                      //               style: TextStyle(
                                      //                   fontWeight:
                                      //                       FontWeight.normal,
                                      //                   fontSize: 12,
                                      //                   color: AppColors
                                      //                       .textColorGreen),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Text(
                                "Jayga",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.textColorGreen),
                              ),
                              const Text(
                                " Protect",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          const Text(
                            "Every booking includes free protection from Host cancellations, listing inaccuracies, and other issues like trouble checking in.",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.black54),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),

                          // Text(
                          //   "Reviews",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 18,
                          //       color: Colors.black54),
                          // ),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.star,
                          //       color: Colors.orange,
                          //     ),
                          //     Text(
                          //       controller.getReviewModel.value
                          //                   .averageRating ==
                          //               null
                          //           ? "5"
                          //           : controller.getReviewModel.value
                          //               .averageRating
                          //               .toString(),
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 18,
                          //           color: Colors.black54),
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Container(
                          //         height: 15,
                          //         width: 2,
                          //         color: Colors.black54),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         // controller.selectReview.value = true;
                          //         Get.to(ReviewListView(),
                          //             arguments: [data]);
                          //       },
                          //       child: Text(
                          //         "${controller.getReview.value.length} reviews",
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.normal,
                          //             fontSize: 18,
                          //             color: AppColors.textColorGreen),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Container(
                          //   height: 140,
                          //   child: Column(
                          //     mainAxisAlignment:
                          //         MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             child: Text(
                          //               "Cleanness",
                          //               style: TextStyle(
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.black),
                          //             ),
                          //           ),
                          //           Row(
                          //             children: [
                          //               AnimatedContainer(
                          //                 duration: Duration(seconds: 2),
                          //                 height: 20,
                          //                 width: 140,
                          //                 decoration: BoxDecoration(
                          //                     color: AppColors
                          //                         .textColorGreen,
                          //                     borderRadius:
                          //                         BorderRadius.circular(
                          //                             50)),
                          //                 alignment: Alignment.center,
                          //               ),
                          //               SizedBox(
                          //                 width: 5,
                          //               ),
                          //               Text(
                          //                 "5.0",
                          //                 style: TextStyle(
                          //                     fontSize: 15,
                          //                     fontWeight: FontWeight.bold,
                          //                     color: Colors.black),
                          //               )
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             child: Text(
                          //               "Communication",
                          //               style: TextStyle(
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.black),
                          //             ),
                          //           ),
                          //           Row(
                          //             children: [
                          //               AnimatedContainer(
                          //                 duration: Duration(seconds: 2),
                          //                 height: 20,
                          //                 width: 140,
                          //                 decoration: BoxDecoration(
                          //                     color: AppColors
                          //                         .textColorGreen,
                          //                     borderRadius:
                          //                         BorderRadius.circular(
                          //                             50)),
                          //                 alignment: Alignment.center,
                          //               ),
                          //               SizedBox(
                          //                 width: 5,
                          //               ),
                          //               Text(
                          //                 "5.0",
                          //                 style: TextStyle(
                          //                     fontSize: 15,
                          //                     fontWeight: FontWeight.bold,
                          //                     color: Colors.black),
                          //               )
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             child: Text(
                          //               "Check-in",
                          //               style: TextStyle(
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.black),
                          //             ),
                          //           ),
                          //           Row(
                          //             children: [
                          //               AnimatedContainer(
                          //                 duration: Duration(seconds: 2),
                          //                 height: 20,
                          //                 width: 140,
                          //                 decoration: BoxDecoration(
                          //                     color: AppColors
                          //                         .textColorGreen,
                          //                     borderRadius:
                          //                         BorderRadius.circular(
                          //                             50)),
                          //                 alignment: Alignment.center,
                          //               ),
                          //               SizedBox(
                          //                 width: 5,
                          //               ),
                          //               Text(
                          //                 "5.0",
                          //                 style: TextStyle(
                          //                     fontSize: 15,
                          //                     fontWeight: FontWeight.bold,
                          //                     color: Colors.black),
                          //               )
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             child: Text(
                          //               "Accuracy",
                          //               style: TextStyle(
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.black),
                          //             ),
                          //           ),
                          //           Row(
                          //             children: [
                          //               AnimatedContainer(
                          //                 duration: Duration(seconds: 2),
                          //                 height: 20,
                          //                 width: 140,
                          //                 decoration: BoxDecoration(
                          //                     color: AppColors
                          //                         .textColorGreen,
                          //                     borderRadius:
                          //                         BorderRadius.circular(
                          //                             50)),
                          //                 alignment: Alignment.center,
                          //               ),
                          //               SizedBox(
                          //                 width: 5,
                          //               ),
                          //               Text(
                          //                 "5.0",
                          //                 style: TextStyle(
                          //                     fontSize: 15,
                          //                     fontWeight: FontWeight.bold,
                          //                     color: Colors.black),
                          //               )
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             child: Text(
                          //               "Location",
                          //               style: TextStyle(
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.black),
                          //             ),
                          //           ),
                          //           Row(
                          //             children: [
                          //               AnimatedContainer(
                          //                 duration: Duration(seconds: 2),
                          //                 height: 20,
                          //                 width: 140,
                          //                 decoration: BoxDecoration(
                          //                     color: AppColors
                          //                         .textColorGreen,
                          //                     borderRadius:
                          //                         BorderRadius.circular(
                          //                             50)),
                          //                 alignment: Alignment.center,
                          //               ),
                          //               SizedBox(
                          //                 width: 5,
                          //               ),
                          //               Text(
                          //                 "5.0",
                          //                 style: TextStyle(
                          //                     fontSize: 15,
                          //                     fontWeight: FontWeight.bold,
                          //                     color: Colors.black),
                          //               )
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             child: Text(
                          //               "Value",
                          //               style: TextStyle(
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.black),
                          //             ),
                          //           ),
                          //           Row(
                          //             children: [
                          //               AnimatedContainer(
                          //                 duration: Duration(seconds: 2),
                          //                 height: 20,
                          //                 width: 140,
                          //                 decoration: BoxDecoration(
                          //                     color: AppColors
                          //                         .textColorGreen,
                          //                     borderRadius:
                          //                         BorderRadius.circular(
                          //                             50)),
                          //                 alignment: Alignment.center,
                          //               ),
                          //               SizedBox(
                          //                 width: 5,
                          //               ),
                          //               Text(
                          //                 "5.0",
                          //                 style: TextStyle(
                          //                     fontSize: 15,
                          //                     fontWeight: FontWeight.bold,
                          //                     color: Colors.black),
                          //               )
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          const Text(
                            "Highlighted reviews",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Container(
                              height: controller.getReview.value.isEmpty
                                  ? 30
                                  : MediaQuery.of(context).size.height *
                                  .13,
                              child: controller.getReview.value.isEmpty
                                  ? const Text("No review yet")
                                  : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller
                                      .getReview.value.length,
                                  itemBuilder: (BuildContext c, i) {
                                    var reviewdata =
                                    controller.getReview[i];
                                    return Card(
                                      child: Container(
                                        width: Get.width * .9,
                                        child: ListTile(
                                          title: Text(
                                            reviewdata.userName ??
                                                "No Data",
                                            style: const TextStyle(
                                                fontSize: 16),
                                          ),
                                          subtitle: Text(
                                            reviewdata.description,
                                          ),
                                          leading:
                                          reviewdata.user
                                              .avatars ==
                                              null
                                              ? CircleAvatar(
                                            radius: 19,
                                            backgroundColor:
                                            AppColors
                                                .textColorGreen,
                                            child:
                                            const CircleAvatar(
                                              radius: 18,
                                              backgroundColor:
                                              Colors
                                                  .white,
                                            ),
                                          )
                                              : Container(
                                            height: 70,
                                            width: 70,
                                            decoration:
                                            const BoxDecoration(
                                              shape: BoxShape
                                                  .circle,
                                            ),
                                            child:
                                            CachedNetworkImage(
                                              //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                              imageUrl:
                                              "https://new.jayga.io/uploads/useravatars/${reviewdata.user.avatars!.userFilename}",
                                              imageBuilder:
                                                  (context,
                                                  imageProvider) =>
                                                  Container(
                                                    decoration:
                                                    BoxDecoration(
                                                      color: Colors
                                                          .transparent,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                      image:
                                                      DecorationImage(
                                                        image:
                                                        imageProvider,
                                                        fit: BoxFit
                                                            .cover,
                                                      ),
                                                    ),
                                                  ),
                                              placeholder: (context,
                                                  url) =>
                                              const Padding(
                                                  padding: EdgeInsets.all(
                                                      5.0),
                                                  child:
                                                  Icon(Icons.verified_user_outlined)),
                                              errorWidget: (context,
                                                  url,
                                                  error) =>
                                              const Padding(
                                                  padding: EdgeInsets.all(
                                                      5.0),
                                                  child:
                                                  Icon(Icons.verified_user_outlined)),
                                            ),
                                            // color: AppColors.backgroundColor,
                                          ),
                                          trailing: Column(
                                            children: [
                                              Text(
                                                DateFormat.yMd()
                                                //.add_jm()
                                                    .format(
                                                  reviewdata
                                                      .createdAt,
                                                ),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight
                                                        .normal,
                                                    color: Colors
                                                        .black54),
                                              ),
                                              Container(
                                                height: MediaQuery.of(
                                                    context)
                                                    .size
                                                    .height *
                                                    .05,
                                                width: Get.width * .2,
                                                child: Center(
                                                  child: RatingBar
                                                      .builder(
                                                    initialRating: reviewdata
                                                        .stars
                                                        .isEmpty
                                                        ? 0
                                                        : int.parse(reviewdata
                                                        .stars)
                                                        .toDouble(),
                                                    minRating: 1,
                                                    direction: Axis
                                                        .horizontal,
                                                    allowHalfRating:
                                                    false,
                                                    itemCount: 5,
                                                    itemSize: 10,
                                                    ignoreGestures:
                                                    true,
                                                    updateOnDrag:
                                                    false,
                                                    // tapOnlyMode: false,
                                                    itemPadding:
                                                    const EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                        0.0),
                                                    itemBuilder:
                                                        (context,
                                                        _) =>
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors
                                                          .amber,
                                                      size: 14,
                                                    ),
                                                    onRatingUpdate:
                                                        (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                          // Center(
                          //   child: Container(
                          //     width: Get.width*.3,
                          //     height: Get.height *.05,
                          //     child: Center(
                          //       child: ListView.builder(
                          //           scrollDirection: Axis.horizontal,
                          //           itemCount: controller
                          //               .getReview.value.length,
                          //           itemBuilder: (BuildContext c, i) {
                          //             var reviewdata =
                          //             controller.getReview[i];
                          //             return Center(
                          //               child: Row(
                          //                 children: [
                          //                   CircleAvatar(
                          //                     radius: 4,
                          //                     backgroundColor:  Colors.grey,
                          //                   ),
                          //                   SizedBox(width: 5,),
                          //                 ],
                          //               ),
                          //             );
                          //           }),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: Center(
                              child: Text(
                                "See All Reviews",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.textColorGreen),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                       ListTile(
                              title: const Text(
                                "Hosted by",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                              subtitle: Text(
                                data.listerName,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(Icons
                                      .verified_user_outlined)),
                            ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              const Text(
                                "15 host reviews",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.verified_user,
                                color: Colors.green,
                              ),
                              const Text(
                                "Identity Verified",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              controller.makePhoneCall("01764314845");
                              //  Get.toNamed(Routes.HOME);
                              //controller.visible.value++;
                              // controller.loginController();
                            },
                            child: Center(
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 2),
                                height: 40,
                                width: MediaQuery.of(context).size.width -
                                    100,
                                decoration: BoxDecoration(
                                    color: AppColors.textColorGreen,
                                    borderRadius:
                                    BorderRadius.circular(50)),
                                alignment: Alignment.center,
                                child: Text(
                                  "Get Support",
                                  style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          const Text(
                            "Location",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black54),
                          ),
                          Text(
                            "View on map:",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: AppColors.textColorGreen),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height *
                                    .4,
                                width: MediaQuery.of(context).size.width,
                                child: GoogleMap(
                                    gestureRecognizers: Set()
                                      ..add(Factory<PanGestureRecognizer>(
                                              () => PanGestureRecognizer()))
                                      ..add(Factory<
                                          VerticalDragGestureRecognizer>(
                                              () =>
                                              VerticalDragGestureRecognizer())),
                                    zoomControlsEnabled: true,
                                    scrollGesturesEnabled: true,
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          double.parse(data.lat),
                                          double.parse(data.long)),
                                      zoom: 10,
                                      //target: LatLng(23.797911, 90.414391),
                                    ),
                                    markers: {
                                      Marker(
                                        markerId: const MarkerId(
                                            'selected-location'),
                                        position: LatLng(
                                            double.parse(data.lat),
                                            double.parse(data.long)),
                                        infoWindow: const InfoWindow(
                                          title: 'Selected Location',
                                        ),
                                      ),
                                    }),
                              ),
                            ],
                          ),
                          // Container(
                          //     margin: EdgeInsets.all(8),
                          //     child: Table(
                          //       border: TableBorder.all(),
                          //       columnWidths: const <int,
                          //           TableColumnWidth>{
                          //         0: IntrinsicColumnWidth(),
                          //         1: FlexColumnWidth(),
                          //         2: FlexColumnWidth(),
                          //       },
                          //       defaultVerticalAlignment:
                          //           TableCellVerticalAlignment.middle,
                          //       children: <TableRow>[
                          //         TableRow(
                          //           decoration: BoxDecoration(
                          //             color: AppColors.textColorGreen,
                          //           ),
                          //           children: <Widget>[
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text(
                          //                 "Company",
                          //                 style: TextStyle(
                          //                     color: AppColors
                          //                         .textColorGreen),
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text("Price",
                          //                   style: TextStyle(
                          //                       color: AppColors
                          //                           .textColorBlack,
                          //                       fontSize: 12)),
                          //             ),
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text("Cancellation policy",
                          //                   style: TextStyle(
                          //                       color: AppColors
                          //                           .textColorBlack,
                          //                       fontSize: 12)),
                          //             ),
                          //           ],
                          //         ),
                          //         TableRow(
                          //           decoration: BoxDecoration(),
                          //           children: <Widget>[
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text(
                          //                 "1. Jayga LTD",
                          //                 style: TextStyle(
                          //                     color: AppColors
                          //                         .textColorGreen),
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text("Price",
                          //                   style: TextStyle(
                          //                       color: AppColors
                          //                           .textColorBlack,
                          //                       fontSize: 12)),
                          //             ),
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Icon(
                          //                 Icons.check,
                          //                 color: Colors.green,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //         TableRow(
                          //           children: <Widget>[
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text(
                          //                 "2. Obokash",
                          //                 style: TextStyle(
                          //                     color: AppColors
                          //                         .textColorGreen),
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text("Price",
                          //                   style: TextStyle(
                          //                       color: AppColors
                          //                           .textColorBlack,
                          //                       fontSize: 12)),
                          //             ),
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Icon(
                          //                 Icons.check,
                          //                 color: Colors.green,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //         TableRow(
                          //           children: <Widget>[
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text(
                          //                 "3. GoZayaan",
                          //                 style: TextStyle(
                          //                     color: AppColors
                          //                         .textColorGreen),
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text("Price",
                          //                   style: TextStyle(
                          //                       color: AppColors
                          //                           .textColorBlack,
                          //                       fontSize: 12)),
                          //             ),
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Icon(
                          //                 Icons.check,
                          //                 color: Colors.green,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //         TableRow(
                          //           children: <Widget>[
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text(
                          //                 "4. Air BNB",
                          //                 style: TextStyle(
                          //                     color: AppColors
                          //                         .textColorGreen),
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Text("Price",
                          //                   style: TextStyle(
                          //                       color: AppColors
                          //                           .textColorBlack,
                          //                       fontSize: 12)),
                          //             ),
                          //             Padding(
                          //               padding:
                          //                   const EdgeInsets.all(4.0),
                          //               child: Icon(
                          //                 Icons.check,
                          //                 color: Colors.green,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     )),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Host Restriction",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    if (controller.seeRestriction.value ==
                                        false) {
                                      controller.seeRestriction.value =
                                      true;
                                    } else {
                                      controller.seeRestriction.value =
                                      false;
                                    }
                                  },
                                  child: controller
                                      .seeRestriction.value ==
                                      false
                                      ? Icon(
                                    Icons
                                        .arrow_drop_down_circle_outlined,
                                    color: AppColors.textColorGreen,
                                  )
                                      : Icon(
                                    Icons.arrow_circle_up,
                                    color: AppColors.textColorGreen,
                                  )),
                            ],
                          ),
                          controller.seeRestriction.value == false
                              ? Container()
                              : Container(
                            height:
                            MediaQuery.of(context).size.height *
                                .34,
                            child: Column(children: [
                              ListTile(
                                title:
                                const Text("Late night entry"),
                                leading: Container(
                                  height: 30,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.bottomLeft,
                                    // color: AppColors.backgroundColor,
                                    child: Image.asset(
                                      'assets/booking/assets/icons/host/restriction/no_entry.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                    "No pets are allowed"),
                                leading: Container(
                                  height: 30,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.bottomLeft,
                                    // color: AppColors.backgroundColor,
                                    child: Image.asset(
                                      'assets/booking/assets/icons/host/restriction/no_smoke.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                    "No parties are allowed"),
                                leading: Container(
                                  height: 30,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.bottomLeft,
                                    // color: AppColors.backgroundColor,
                                    child: Image.asset(
                                      'assets/booking/assets/icons/host/restriction/party.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),

                          const Divider(),
                          Row(
                            children: [
                              const Icon(
                                Icons.flag,
                                color: Colors.red,
                              ),
                              const Text(
                                "Report this posting",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
