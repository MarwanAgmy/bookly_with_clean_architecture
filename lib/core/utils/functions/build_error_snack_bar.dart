import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String text) {
  return SnackBar(
    content: Text(text),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 0),
  );
}
