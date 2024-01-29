import 'package:cityproject/app/module/home/binding/home_binding.dart';
import 'package:cityproject/app/module/home/view/home_view.dart';
import 'package:cityproject/app/module/splash/binding/splash_binding.dart';
import 'package:cityproject/app/module/splash/view/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  // static const INITIAL = Routes.Test;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),



  ];
}
