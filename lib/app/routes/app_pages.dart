import 'package:get/get.dart';
import 'package:note_app/app/modules/creatnotes/creatnotes_binding.dart';
import 'package:note_app/app/modules/creatnotes/creatnotes_page.dart';
import 'package:note_app/app/modules/home/home_binding.dart';
import 'package:note_app/app/modules/home/home_page.dart';
import 'package:note_app/app/modules/login/login_binding.dart';
import 'package:note_app/app/modules/login/login_page.dart';
import 'package:note_app/app/modules/splash/splash_binding.dart';
import 'package:note_app/app/modules/splash/splash_page.dart';
import 'package:note_app/app/routes/app_routes.dart';

class AppPages {
  static final getPages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.CREATNOTES,
      page: () => CreatNotesPage(),
      binding: CreatNotesBinding(),
    ),
  ];
}
