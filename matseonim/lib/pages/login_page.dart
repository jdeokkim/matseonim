import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:matseonim/components/custom_text_form_field.dart';
import 'package:matseonim/components/custom_elevated_button.dart';
import 'package:matseonim/pages/main_page.dart';
import 'package:matseonim/utils/validator.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

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
                "이메일로 로그인",
                style: TextStyle(
                  fontSize: 32, 
                  color: Colors.white
                ),
              ),
            ),
            _emailLoginForm(),
          ],
        ),
      ),
    );
  }
}

Widget _emailLoginForm() {
  final _formKey = GlobalKey<FormState>();

  return Form(
    key: _formKey,
    child: Column(
      children: [
        CustomTextFormField(
          hint: "이메일",
          funValidator: validateEmail(),
        ),
        CustomTextFormField(
          hint: "비밀번호",
          funValidator: validatePassword(),
        ),
        CustomElevatedButton(
          text: "로그인",
          funPageRoute: () {
            if (_formKey.currentState!.validate()) {
              Get.to(MainPage());
            }
          },
        ),
      ],
    ),
  );
}
