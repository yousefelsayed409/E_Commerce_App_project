import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/featuears/profile/components/body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
             automaticallyImplyLeading: false,

        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor ?? AppColors.Teal, // يستخدم لون الثيم الحالي
        title: const Text("Profile"),
      ),
      body: const Bodyprofile(),
    );
  }
}
