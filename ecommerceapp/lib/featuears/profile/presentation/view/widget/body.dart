import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/localization/localization.dart';
import 'package:ecommerceapp/featuears/profile/presentation/view/widget/show_dialog_widget.dart';
import 'package:ecommerceapp/featuears/profile/presentation/view/setting_view.dart';
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
            text: "My Account".tr(context),
            asetsimage: Icons.account_circle,
            press: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  const MyAccountScreen();
              }))
            },
          ),
          ProfileMenu(
            text: "Notifications".tr(context),
            asetsimage: Icons.notifications,
            press: () {},
          ),
          ProfileMenu(
            text: "Settings".tr(context),
            asetsimage: Icons.settings,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  DarkAndLightView();
              }));
            },
          ),
          ProfileMenu(
            text: "Help Center".tr(context),
            asetsimage: Icons.help,
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out".tr(context),
            asetsimage: Icons.exit_to_app,
            press: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor:
                        
                                            CashNetwork.getCashData(key: 'theme') == 'light'
                                ? Colors.white
                                : Colors.white,
                                          
                      content:  const ShowDialogWidget(),
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
