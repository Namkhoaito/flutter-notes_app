import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/model/user.dart';

class LocalAuth {
  FlutterSecureStorage _flutterSecureStorage = Get.find<FlutterSecureStorage>();

  Future<void> setUseToken(UserToken userToken) async {
    await _flutterSecureStorage.write(
        key: 'KEYKEY', value: jsonEncode(userToken.toJson()));
  }

  Future<UserToken> getUserToken() async {
    final _data = await _flutterSecureStorage.read(key: 'KEYKEY');
    if (_data != null) {
      return UserToken.fromJson(jsonDecode(_data));
    }

    return null;
  }

  Future<void> clear() async {
    await _flutterSecureStorage.delete(key: 'KEYKEY');
  }
}
