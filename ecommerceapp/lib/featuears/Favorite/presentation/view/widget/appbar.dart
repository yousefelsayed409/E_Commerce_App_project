import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:flutter/material.dart';


AppBar buildAppBarfav(BuildContext context) {
  return AppBar(
     automaticallyImplyLeading: false,
    backgroundColor: Colors.teal,
    elevation: 5,
    centerTitle: true,
    title: Text(
      "Your Favorite ",
      style: TextStyle(
        fontSize: 20,
                       color:  CashNetwork.getCashData(key: 'theme') == 'light'
                                ? Colors.white
                                : Colors.white,
                                          )
    ),
  );
}
