import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/model/notes.dart';

class FirebaseFireStoreRepository {
  FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  FirebaseAuth _firebaseAuth = Get.find();

  Future<void> addNotes(Notes notes) async {
    await _firebaseFirestore
        .collection('Notes')
        .doc(_firebaseAuth.currentUser.uid)
        .collection('listNotes')
        .doc(notes.id.toString())
        .set({
      'id': notes.id,
      'title': notes.title,
      'colorIndex': notes.colorIndex,
      'content': notes.content,
      'dateTime': notes.dateTime.toString()
    });
  }

  Future<void> upDate(Notes notes) async {
    await _firebaseFirestore
        .collection('Notes')
        .doc(_firebaseAuth.currentUser.uid)
        .collection('listNotes')
        .doc(notes.id.toString())
        .update({
      'id': notes.id,
      'title': notes.title,
      'colorIndex': notes.colorIndex,
      'content': notes.content,
      'dateTime': notes.dateTime.toString()
    });
  }

  Future<void> delete(Notes notes) async {
    await _firebaseFirestore
        .collection('Notes')
        .doc(_firebaseAuth.currentUser.uid)
        .collection('listNotes')
        .doc(notes.id.toString())
        .delete();
  }
}
