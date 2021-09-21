import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matseonim/components/custom_elevated_button.dart';
import 'package:matseonim/components/login_alert_dialog.dart';
import 'package:matseonim/components/login_autocomplete_form.dart';
import 'package:matseonim/firebase/user_data.dart';
import 'package:matseonim/pages/login_page.dart';

class JoinPage2 extends StatelessWidget {
  final UserData userData;

  const JoinPage2({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: const Text(
                "회원가입 (2/2)",
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            _joinForm(userData)
          ],
        ),
      ),
    );
  }
}

Widget _joinForm(UserData userData) {
  final _formKey = GlobalKey<FormState>();

  return Form(
    key: _formKey,
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: AutocompleteForm(hintText: "전문 분야를 입력해 주세요"),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: AutocompleteForm(hintText: "관심 분야를 입력해 주세요"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomElevatedButton(
            text: "회원가입",
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                _userSignUp(
                  email: userData.email,
                  password: userData.password
                );
              }
            },
          ),
        ),
      ],
    ),
  );
}

void _userSignUp({required String email, required String password}) async {
  try {
    UserCredential _ = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    Get.to(LoginPage());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      Get.dialog(const LoginAlertDialog(message: "이미 사용 중인 이메일 주소입니다."));
    }
  }
}