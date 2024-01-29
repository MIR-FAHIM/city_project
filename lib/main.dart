
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:cityproject/app/services/location_service.dart';


import 'app/routes/app_pages.dart';

initAllServices() async {
  Get.log('starting all services ...');

  await GetStorage.init();
  // await Get.putAsync<SettingsService>(() async => SettingsService());
 // await Get.putAsync<AuthService>(() async => AuthService());
  Get.log('All services started...');
  await Get.putAsync<LocationService>(() async => LocationService());
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await initAllServices();
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Jayga",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      )
  );
}


///    <uses-permission android:name="android.permission.CALL_PHONE" />
///     <uses-permission android:name="android.permission.READ_PHONE_NUMBERS" />
