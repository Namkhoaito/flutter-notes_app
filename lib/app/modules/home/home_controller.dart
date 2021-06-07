import 'package:get/get.dart';
import 'package:note_app/app/data/model/notes.dart';
import 'package:note_app/app/data/provider/database.dart';
import 'package:note_app/app/data/repository/firebase_firestore.dart';
import 'package:note_app/app/data/repository/firebase_reposittory.dart';
import 'package:note_app/app/data/repository/local_auth_repositrory.dart';
import 'package:note_app/app/routes/app_routes.dart';

class HomeController extends GetxController {
  FirebaseRepository _firebaseRepository = Get.find<FirebaseRepository>();
  LocalAuthRepository _localAuthRepository = Get.find<LocalAuthRepository>();
  FirebaseFireStoreRepository _firebaseFireStoreRepository =
      Get.find<FirebaseFireStoreRepository>();

  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();

  var notes = [].obs;

  void addClick() async {
    Get.toNamed(AppRoutes.CREATNOTES);
  }

  void loadNotes() async {
    _databaseHelper.getAllNotes().then((value) {
      notes.value = value;
    });
  }

  void deleteNote(Notes notes) {
    _databaseHelper.delete(notes.id);
    _firebaseFireStoreRepository.delete(notes);
    loadNotes();
  }

  void onTap(Notes notes) {
    Get.toNamed(AppRoutes.CREATNOTES, arguments: notes);
  }

  void updateOnline() async {
    await notes.forEach((element) {
      _firebaseFireStoreRepository.addNotes(element);
    });
  }

  void logOut() async {
    await _firebaseRepository.logOut();
    await _databaseHelper.deleteAll();
    await _localAuthRepository.delete();
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }
}
