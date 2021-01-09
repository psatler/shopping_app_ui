import 'package:flutter/material.dart';

import 'profile_menu_item.dart';
import 'profile_picture.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePicture(),
          const SizedBox(height: 20),
          ProfileMenuItem(
            icon: "assets/icons/User Icon.svg",
            text: "My Account",
            press: () {},
          ),
          ProfileMenuItem(
            icon: "assets/icons/Bell.svg",
            text: "Notifications",
            press: () {},
          ),
          ProfileMenuItem(
            icon: "assets/icons/Settings.svg",
            text: "Settings",
            press: () {},
          ),
          ProfileMenuItem(
            icon: "assets/icons/Question mark.svg",
            text: "Help Center",
            press: () {},
          ),
          ProfileMenuItem(
            icon: "assets/icons/Log out.svg",
            text: "Log out",
            press: () {},
          ),
        ],
      ),
    );
  }
}
