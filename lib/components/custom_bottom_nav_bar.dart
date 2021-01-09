import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/profile/profile_screen.dart';
import '../screens/home/home_screen.dart';
import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Color inActiveIconColor = Color(0xFFB6B6B6);

  CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.45),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Heart Icon.svg",
                color: MenuState.favorite == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
                color: MenuState.message == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
