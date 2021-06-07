import 'package:get/get.dart';
import 'package:note_app/app/data/model/user.dart';
import 'package:note_app/app/data/repository/local_auth_repositrory.dart';
import 'package:note_app/app/routes/app_routes.dart';

class SplashController extends GetxController {
  LocalAuthRepository _localAuthRepository = Get.find<LocalAuthRepository>();
  @override
  void onReady() {
    init();
  }

  void init() async {
    final UserToken _userToke = await _localAuthRepository.userToken;
    Get.offNamed(_userToke != null ? AppRoutes.HOME : AppRoutes.LOGIN);
  }
}
