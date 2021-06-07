import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:note_app/app/data/model/notes.dart';
import 'package:note_app/app/data/provider/database.dart';
import 'package:note_app/app/data/repository/firebase_firestore.dart';
import 'package:note_app/app/modules/home/home_controller.dart';

class CreatNotesController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  HomeController _homeController = Get.find<HomeController>();
  HtmlEditorController controller = HtmlEditorController();
  FirebaseFireStoreRepository _firebaseFireStoreRepository =
      Get.find<FirebaseFireStoreRepository>();

  TextEditingController txtTitle;
  TextEditingController txtContent;

  Notes _notes;

  var _isSelected = 0.obs;
  get isSelected => _isSelected.value;
  set isSelected(val) => _isSelected.value = val;

  void radioClick(int val) {
    isSelected = val;
    print('=========== isSelected=$isSelected');
  }

  void backPress() {
    Get.back();
  }

  void savePress() {
    if (!txtTitle.text.isEmpty || !txtContent.text.isEmpty) {
      if (_notes == null) {
        Notes _notes1 = Notes(
            id: new DateTime.now().millisecondsSinceEpoch,
            title: txtTitle.text,
            content: txtContent.text,
            colorIndex: isSelected,
            dateTime: DateTime.now());
        _databaseHelper.insertNotes(_notes1);
        _firebaseFireStoreRepository.addNotes(_notes1);
      } else {
        _notes.title = txtTitle.text;
        _notes.content = txtContent.text;
        _notes.colorIndex = isSelected;
        _notes.dateTime = DateTime.now();
        _databaseHelper.update(_notes);
        _firebaseFireStoreRepository.upDate(_notes);
      }
      Get.back();
    } else {
      Get.defaultDialog(
        title: 'Thông báo',
        content: Text('Nội dung đang trống'),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    txtTitle = TextEditingController();
    txtContent = TextEditingController();
    this._notes = Get.arguments as Notes;
    if (_notes != null) {
      txtTitle.text = _notes.title;
      txtContent.text = _notes.content;
      isSelected = _notes.colorIndex;
    } else {
      isSelected = 0;
    }
  }

  @override
  void onClose() {
    super.onClose();
    txtContent.dispose();
    txtTitle.dispose();
    _notes = null;
    _homeController.loadNotes();
  }
}
