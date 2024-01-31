import 'package:cityproject/app/api_providers/api_manager.dart';
import 'package:cityproject/app/api_providers/api_url.dart';
import 'package:cityproject/app/model/booking/models/booking_history_model.dart';
import 'package:cityproject/app/model/booking/models/get_notification_model.dart';
import 'package:cityproject/app/model/booking/models/listing/filtered_listing_model.dart';
import 'package:cityproject/app/model/booking/models/listing_model.dart';
import 'package:cityproject/app/model/booking/models/profile/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/booking/models/listing/get_listing_images_model.dart';


class ListingRep {
  Future<ListingMOdel> listingRep() async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
      "https://jayga.xyz/API/V1/listing-api.php",
    );
    print("login response is $response");

    return ListingMOdel.fromJson(response);
  }

  Future deleteListingImage({
    String? imageID,
  }) async {
    APIManager _manager = APIManager();
    print("delete image response is calling");
    final response = await _manager.get(
      ApiUrl.deleteListingImage + imageID!,
    );
    print("delete image");
    print("delete image $response");

    return response;
  }
  Future<GetNotificationModel> getNotification({
    String? id,

  }) async {
    APIManager _manager = APIManager();
    print("filtered response is calling");
    final response = await _manager.get(
      "${ApiUrl.getNotification}$id",
    );
    print("filtered response is calling before response");
    print("filtered response is $response");

    return GetNotificationModel.fromJson(response);
  }


  Future<GetListingFilterModel> filteredListing({
    String? guestNo,
    String? bedNo,
    String? district,
    String? town,
    String? allow_short_stay,
  }) async {
    APIManager _manager = APIManager();
    print("filtered response is calling");
    final response = await _manager.get(
      "https://new.jayga.io/api/filter-listings",
    );
    print("filtered response is calling before response");
    print("filtered response is $response");

    return GetListingFilterModel.fromJson(response);
  }

  Future<GetListingImagesModel> getListingImages(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
      "${ApiUrl.getListingImages}$id",
    );
    print("listing images is $response");

    return GetListingImagesModel.fromJson(response);
  }

  Future<ProfileModel> getProfile(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
      "${ApiUrl.getProfile}$id",
    );
    print("profile response is $response");

    return ProfileModel.fromJson(response);
  }

  Future getDisableDates(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get(
      "${ApiUrl.getDisableDates}$id",
    );
    print("disable dates response is $response");

    return response;
  }

  addDisableDate({String? listerId, String? listingId, String? dates}) async {
    var response;
    APIManager _manager = APIManager();

    response = await _manager.postAPICall(ApiUrl.addDisableDate, {
      "lister_id": listerId!,
      "listing_id": listingId!,
      "dates": dates!,
    });

    print("disable day added is $response");
    return response;
  }
  deleteDisableDate({String? listerId, String? listingId, String? dates}) async {
    var response;
    APIManager _manager = APIManager();

    response = await _manager.postAPICall(ApiUrl.deleteDisableDate, {
      "lister_id": listerId!,
      "listing_id": listingId!,
      "date": dates!,
    });

    print("disable day added is $response");
    return response;
  }
  editProfile({
    String? user_id,
    String? lister_id,
  }) async {
    Map<String, String> data = {
      "user_id": user_id!,
      "user_name": "mir101",
      "user_email": "mir@gamil.com",
      "phone": "02783084390",
      "user_nid": "34132431",
      "user_dob": "1994-11-29",
      "user_address": "jessore",
      "is_lister": "1",
      //"photo":,
    };

    // string to uri"
    var uri = Uri.parse(
      ApiUrl.updateProfile,
    );

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    request.fields.addAll(data);
    // request.headers.addAll(
    //   {
    //     //'X-Requested-With': 'XMLHttpRequest',
    //     // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
    //     // 'Content-Type': 'multipart/form-data',
    //
    //     "Content-Type": "application/json",
    //     // "Accept": "application/json"
    //
    //     // "Accept-Encoding": "gzip, deflate, br",
    //     // "Accept":"*/*",
    //     // "Connection": "keep-alive"
    //   },
    // );
    // send
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    var bb = jsonDecode(response.body);
    return bb;
  }

  Future<BookingHistory> bookingHistory(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
        "https://new.jayga.io/api/booking-history", {"user_id": id});
    print("booking historyy response is $response");

    return BookingHistory.fromJson(response);
  }




















  uploadNidImage({
    String? listing_id,
    String? lister_id,
    List<File>? listImages,
  }) async {
    Map<String, String> data = {
      "listing_id": listing_id!,
      "user_id": lister_id!,
    };
    print("my listing id is $listing_id");
    // string to uri"
    var uri = Uri.parse(ApiUrl.addListingNIDImage);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    // add file to multipart
    for (int i = 0; i < listImages!.length; i++) {
      print("hlw 1");
      // open a bytestream
      var stream =
          new http.ByteStream(DelegatingStream.typed(listImages[i].openRead()));
      // get file length
      print("hlw 2");
      var length = await listImages[i].length();
      print("hlw 3");
      var multipartFile = new http.MultipartFile(
          'listing_nid[]', stream, length,
          filename: basename(listImages[i].path));
      print("hlw 4");
      request.files.add(multipartFile);
    }

    // if (_image.length > 0) {
    //   for (var i = 0; i < _image.length; i++) {
    //     request.files.add(http.MultipartFile('picture',
    //         File(_image[i].path).readAsBytes().asStream(), File(_image[i].path).lengthSync(),
    //         filename: basename(_image[i].path.split("/").last)));
    //   }

    request.fields.addAll(data);
    request.headers.addAll(
      {
        //'X-Requested-With': 'XMLHttpRequest',
        // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        // 'Content-Type': 'multipart/form-data',

        "Content-Type": "application/json",
        // "Accept": "application/json"

        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"
      },
    );
    // send
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    // listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print("hlw everyone $value");
    //    a = value;
    // });
    // print("hlw sujkkur ${response.stream}");
    var bb = jsonDecode(response.body);
    return bb;
  }

  upload({
    String? listing_id,
    String? lister_id,
    List<File>? listImages,
    File? imageFile,
  }) async {
    Map<String, String> data = {
      "listing_id": listing_id!,
      "lister_id": lister_id!,
    };
    print("my listing id is $listing_id");
    // string to uri"
    var uri = Uri.parse(ApiUrl.addListingImage);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    // add file to multipart
    for (int i = 0; i < listImages!.length; i++) {
      print("hlw 1");
      // open a bytestream
      var stream =
          new http.ByteStream(DelegatingStream.typed(listImages[i].openRead()));
      // get file length
      print("hlw 2");
      var length = await listImages[i].length();
      print("hlw 3");
      var multipartFile = new http.MultipartFile(
          'listing_pictures[]', stream, length,
          filename: basename(listImages[i].path));
      print("hlw 4");
      request.files.add(multipartFile);
    }

    // if (_image.length > 0) {
    //   for (var i = 0; i < _image.length; i++) {
    //     request.files.add(http.MultipartFile('picture',
    //         File(_image[i].path).readAsBytes().asStream(), File(_image[i].path).lengthSync(),
    //         filename: basename(_image[i].path.split("/").last)));
    //   }

    request.fields.addAll(data);
    request.headers.addAll(
      {
        //'X-Requested-With': 'XMLHttpRequest',
        // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        // 'Content-Type': 'multipart/form-data',

        "Content-Type": "application/json",
        // "Accept": "application/json"

        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"
      },
    );
    // send
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    // listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print("hlw everyone $value");
    //    a = value;
    // });
    // print("hlw sujkkur ${response.stream}");
    var bb = jsonDecode(response.body);
    return bb;
  }

  uploadUserImage({
    String? userID,
    List<File>? listImages,
    File? imageFile,
  }) async {
    Map<String, String> data = {
      "user_id": userID!,
    };
    print("uploading user image________________________");
    // string to uri"
    var uri = Uri.parse(ApiUrl.addUserImage);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    // add file to multipart
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile!.openRead()));
    // get file length
    print("hlw 2");
    var length = await imageFile!.length();
    var multipartFile = new http.MultipartFile('photo', stream, length,
        filename: basename(imageFile.path));
    print("hlw 4");
    request.files.add(multipartFile);
    // if (_image.length > 0) {
    //   for (var i = 0; i < _image.length; i++) {
    //     request.files.add(http.MultipartFile('picture',
    //         File(_image[i].path).readAsBytes().asStream(), File(_image[i].path).lengthSync(),
    //         filename: basename(_image[i].path.split("/").last)));
    //   }

    request.fields.addAll(data);
    request.headers.addAll(
      {
        //'X-Requested-With': 'XMLHttpRequest',
        // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        // 'Content-Type': 'multipart/form-data',

        "Content-Type": "application/json",
        // "Accept": "application/json"

        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"
      },
    );
    // send
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    // listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print("hlw everyone $value");
    //    a = value;
    // });
    // print("hlw sujkkur ${response.stream}");
    var bb = jsonDecode(response.body);
    return bb;
  }

// cover photo
  uploadUserCoverImage({
    String? userID,
    List<File>? listImages,
    File? imageFile,
  }) async {
    Map<String, String> data = {
      "user_id": userID!,
    };
    print("uploading user image________________________");
    // string to uri"
    var uri = Uri.parse(ApiUrl.addCoverPhoto);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    // add file to multipart
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile!.openRead()));
    // get file length
    print("hlw 2");
    var length = await imageFile!.length();
    var multipartFile = new http.MultipartFile('photo', stream, length,
        filename: basename(imageFile.path));
    print("hlw 4");
    request.files.add(multipartFile);
    // if (_image.length > 0) {
    //   for (var i = 0; i < _image.length; i++) {
    //     request.files.add(http.MultipartFile('picture',
    //         File(_image[i].path).readAsBytes().asStream(), File(_image[i].path).lengthSync(),
    //         filename: basename(_image[i].path.split("/").last)));
    //   }

    request.fields.addAll(data);
    request.headers.addAll(
      {
        //'X-Requested-With': 'XMLHttpRequest',
        // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        // 'Content-Type': 'multipart/form-data',

        "Content-Type": "application/json",
        // "Accept": "application/json"

        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"
      },
    );
    // send
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    // listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print("hlw everyone $value");
    //    a = value;
    // });
    // print("hlw sujkkur ${response.stream}");
    var bb = jsonDecode(response.body);
    return bb;
  }
}
