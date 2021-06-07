import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_app/app/data/provider/local_auth.dart';
import 'package:note_app/app/data/repository/firebase_firestore.dart';
import 'package:note_app/app/data/repository/firebase_reposittory.dart';
import 'package:note_app/app/data/repository/local_auth_repositrory.dart';

import 'data/provider/database.dart';

class DependencyInjection {
  static void init() {
    Get.put(FlutterSecureStorage());
    Get.put(DatabaseHelper());
    Get.put(LocalAuth());
    Get.put(LocalAuthRepository());
    Get.put(FirebaseAuth.instance);
    Get.put(GoogleSignIn());
    Get.put(FirebaseRepository());
    Get.put(FirebaseFirestore.instance);
    Get.put(FirebaseFireStoreRepository());
  }

  static List<String> colors = [
    '0xFFFFFFFF',
    '0xff8ED1FC',
    '0xffFFF9C4',
    '0xff7BDCB5',
    '0xffC8E6C9',
    '0xffFFCCBC',
    '0xffE1BEE7'
  ];
}
