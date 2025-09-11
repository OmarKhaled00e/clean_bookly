import 'package:flutter/material.dart';

SnackBar buildErrorWidget(String errMessage) {
    return SnackBar(
      content: Text(errMessage, style: TextStyle(color: Colors.black)),
      duration: Duration(seconds: 3),
    );
  }