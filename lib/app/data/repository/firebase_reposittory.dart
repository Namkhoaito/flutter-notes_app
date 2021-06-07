import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_app/app/data/model/user.dart';
import 'package:note_app/app/data/repository/local_auth_repositrory.dart';

class FirebaseRepository {
  FirebaseAuth _firebaseAuth = Get.find<FirebaseAuth>();
  GoogleSignIn _googleSignIn = Get.find<GoogleSignIn>();
  LocalAuthRepository _localAuthRepository = Get.find<LocalAuthRepository>();

  Future<UserCredential> signInWithGoogle() async {
    try {
      GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleSignInAuthentication =
          await _googleSignInAccount.authentication;

      GoogleAuthCredential _googleAuthCredential =
          await GoogleAuthProvider.credential(
        accessToken: _googleSignInAuthentication.accessToken,
        idToken: _googleSignInAuthentication.idToken,
      );
      await _localAuthRepository.set(UserToken(
          accessToken: _googleSignInAuthentication.accessToken,
          idToken: _googleSignInAuthentication.idToken));
      return await _firebaseAuth.signInWithCredential(_googleAuthCredential);
    } catch (e) {
      await _localAuthRepository.delete();
      throw e;
    }
  }

  Future<void> logOut() async {
    Future.wait([_googleSignIn.signOut(), _firebaseAuth.signOut()]);
  }
}
