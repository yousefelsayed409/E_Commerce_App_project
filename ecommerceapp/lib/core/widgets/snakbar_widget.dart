import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showsnakbarwidget(
    BuildContext context, String message, bool forSuccessOrFailure) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,
  ));
}
 


