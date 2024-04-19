import 'package:flutter/material.dart';

class ButtonStyles{
  static final ButtonStyle FixedButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    fixedSize: Size(80, 56),
    backgroundColor: Color(0xff9CC4AB),
  );
}
