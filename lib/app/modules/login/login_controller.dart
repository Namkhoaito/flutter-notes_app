import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/repository/firebase_reposittory.dart';
import 'package:note_app/app/routes/app_routes.dart';

class LoginController extends GetxController {
  FirebaseRepository _firebaseRepository = Get.find<FirebaseRepository>();

  void loginGoogle() async {
    try {
      await _firebaseRepository.signInWithGoogle();
      Get.offNamed(AppRoutes.HOME);
    } on FirebaseException catch (e) {
      if (e.code == 'user-disabled') {
        Get.snackbar('Thông báo', 'Tài khoản bị khoá rồi',
            snackPosition: SnackPosition.BOTTOM);
      }
      await _firebaseRepository.logOut();
    } catch (e) {
      Get.snackbar('Thông báo', 'Đang bị lỗi gì đấy thử lại sau.',
          snackPosition: SnackPosition.BOTTOM);
      await _firebaseRepository.logOut();
    }
  }
}
