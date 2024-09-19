import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.h),
        color: kSecondaryColor.withOpacity(0.1),
        // color: Colors.green,
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration:  InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: (20.h), vertical: (15.h)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
