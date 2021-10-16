import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:matseonim/components/custom_drawer_header.dart';
import 'package:matseonim/models/user.dart';
import 'package:matseonim/pages/create_request_page.dart';
import 'package:matseonim/pages/main_page.dart';
import 'package:matseonim/pages/my_mhi_page.dart';
import 'package:matseonim/pages/my_msi_page.dart';
import 'package:matseonim/pages/my_account_page.dart';
import 'package:matseonim/pages/inquiry_page.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder(
            future: MSIUser.init(),
            builder: (BuildContext context, AsyncSnapshot<MSIUser> snapshot) {
              if (!snapshot.hasData) {
                return SizedBox(
                  height: 160,
                  child: Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator()
                  )
                );
              } else {
                return CustomDrawerHeader(user: snapshot.data!);
              }
            }
          ),
          ListTile(
            title: const Text('홈 화면'),
            onTap: () async {
              Get.back();
              await Get.to(MainPage());
            }
          ),
          ListTile(
            title: const Text('내 정보'),
            onTap: () async {
              Get.back();
              await Get.to(MyAccountPage1());
            }
          ),
          ListTile(
            title: const Text('의뢰하기'),
            onTap: () async {
              Get.back();
              await Get.to(CreateRequestPage());
            }
          ),
          ListTile(
            title: const Text('내 맞선임'),
            onTap: () async {
              Get.back();
              await Get.to(MyMSIPage());
            }
          ),
          ListTile(
            title: const Text('내 맞후임'),
            onTap: () async {
              Get.back();
              await Get.to(MyMHIPage());
            }
          ),
          ListTile(
            title: const Text('문의하기'),
            onTap: () async {
              Get.back();
              await Get.to(InquiryPage());
            }
          ),
        ],
      )
    );
  }
}