import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:note_app/app/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController _loginController = Get.find<LoginController>();
    return Scaffold(
      body: Center(
          child: Container(
              height: 45,
              child: SignInButton(
                Buttons.Google,
                onPressed: _loginController.loginGoogle,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ))),
    );
  }
}
