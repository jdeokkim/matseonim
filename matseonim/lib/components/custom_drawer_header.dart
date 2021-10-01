import 'package:flutter/material.dart';

import 'package:matseonim/components/custom_circle_avatar.dart';
import 'package:matseonim/models/user.dart';

class CustomDrawerHeader extends StatelessWidget {
  final MSIUser? user;
  
  const CustomDrawerHeader({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DrawerHeader(
        child: Column(
          children: [
            Row(children: [
              CustomCircleAvatar(size: 84, url: user?.avatarUrl ?? ""),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user?.name ?? "(이름)",
                      style: const TextStyle(
                        fontSize: 32,
                      )),
                  SizedBox(height: 8),
                  Text(user?.baseName ?? "(부대 명칭)",
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                ],
              )
            ])
          ],
        ),
      ),
    );
  }

}