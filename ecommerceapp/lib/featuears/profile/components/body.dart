import 'package:ecommerceapp/featuears/profile/components/show_dialog_widget.dart';
import 'package:ecommerceapp/featuears/profile/setting_view.dart';
import 'package:flutter/material.dart';

import '../my_account_screen.dart';

import 'profile_menu.dart';

class Bodyprofile extends StatelessWidget {
  const Bodyprofile({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            asetsimage: Icons.account_circle,
            press: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  MyAccountScreen();
              }))
            },
          ),
          ProfileMenu(
            text: "Notifications",
            asetsimage: Icons.notifications,
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            asetsimage: Icons.settings,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  DarkAndLightView();
              }));
            },
          ),
          ProfileMenu(
            text: "Help Center",
            asetsimage: Icons.help,
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            asetsimage: Icons.exit_to_app,
            press: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      content: const ShowDialogWidget(),
                    );
                  },
                );
            },
          ),
        ],
      ),
    );
  }
}
