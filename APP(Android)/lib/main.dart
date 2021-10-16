import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:matseonim/pages/intro_page.dart';
import 'package:matseonim/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: msiThemeData,
      home: IntroPage(),
    );
  }
}