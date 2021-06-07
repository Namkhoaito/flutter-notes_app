import 'package:get/get.dart';
import 'package:note_app/app/data/model/user.dart';
import 'package:note_app/app/data/provider/local_auth.dart';

class LocalAuthRepository {
  LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<void> set(UserToken userToken) => _localAuth.setUseToken(userToken);
  Future<UserToken> get userToken => _localAuth.getUserToken();
  Future<void> delete() => _localAuth.clear();
}
