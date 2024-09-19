import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:flutter/material.dart';


AppBar buildAppBarfav(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.teal,
    elevation: 5,
    centerTitle: true,
    title: Text(
      "Your Favorite ",
      style: AppStyles.textStyle20n,
    ),
  );
}
