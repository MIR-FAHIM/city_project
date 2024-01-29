import 'package:cityproject/app/model/district_model.dart';
import 'package:cityproject/app/repositories/home_rep.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController
  final districtList = <DisResult>[].obs;
 final selectedDis = "".obs;
  final balance = '0.0'.obs;
  final phoneController = TextEditingController().obs;

  //Community Services Icons
  List<String> communityServices = [
    "assets/service_assets/news.png",
    "assets/service_assets/business.png",
    "assets/service_assets/events.png",
    "assets/service_assets/hospital.png",
    "assets/service_assets/education.png",
    "assets/service_assets/blood.png",
    "assets/service_assets/jobfind.png",
    "assets/service_assets/ambulanceI.png",
  ];
  //Community Service Name
  List<String> communityServicesName = [
    "Local News",
    "Business",
    "Events",
    "Hospitals",
    "Education",
    "Blood Donate",
    "Job Find",
    "Ambulance",
  ];

  //Home Service Category icons
  List<String> homeServices = [
    "assets/service_assets/carrent.png",
    "assets/service_assets/billpay.png",
    "assets/service_assets/cylynder.png",
    "assets/service_assets/discount.png",
  ];

  //Home Service Name
  List<String> homeServicesName = [
    "Car Rent",
    "Bill Pay",
    "Cylinder",
    "Discount"
  ];

//Utility Service Icons
  List<String> utilitiesService = [
    "assets/service_assets/emergency.png",
    "assets/service_assets/repair.png",
    "assets/service_assets/tolet.png",
    "assets/service_assets/buysell.png",
  ];

  //Utility Service Name
  List<String> utilityServicesName = [
    "24/7 Service",
    "Repair",
    "To-Let",
    "Buy Sell",
  ];

  //--->List of Trneding Servince<--

  List<String> trendingService = [
    "assets/service_assets/discount.png",
    "assets/service_assets/cylynder.png",
    "assets/service_assets/carrent.png",
    "assets/service_assets/billpay.png",
    "assets/service_assets/buysell.png",
    "assets/service_assets/tolet.png",
    "assets/service_assets/jobfind.png",
    "assets/service_assets/repair.png"
  ];

  //List of Trending Service Name

  List<String> trendingServiceName = [
    "Discount",
    "Cylender",
    "Car Rent",
    "Bill Pay",
    "Buy Sell",
    "To-Let",
    "Job Find",
    "Re-pair"
  ];

  @override
  Future<void> onInit() async {
 // getDisController();
  }

  Future refreshHome() async {

  }



  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  // getDisController() async {
  //   print("get district started");
  //   HomeRep().getDistrict().then((e) async {
  //     print("get district data$e");
  //
  //     var data = DistrictModel.fromJson(e);
  //     districtList.value = data.result!;
  //   });
  // }

}


