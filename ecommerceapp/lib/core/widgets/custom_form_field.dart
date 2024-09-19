import 'package:flutter/material.dart';

import '../utils/constants.dart';

TextFormField buildFormField({
  required TextEditingController controller,
  required String label , required String hitt
}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    onChanged: (value) {},
    validator: (value) {
      if (controller.text.isEmpty) {

      } 
      else   {
          return null;
      };
return null;
    
    },
    decoration: InputDecoration(
      labelText: label,
      hintText: hitt,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: outlineInputBorder(),
      focusedBorder: outlineInputBorder(),
    ),
  );
}
