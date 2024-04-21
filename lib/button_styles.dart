import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle TimeButton(){
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      fixedSize: Size(80,56),
      backgroundColor: Color(0xff99BEAA),
    );
  }

  static ButtonStyle ChordButton(bool isEnabled) {
    if (isEnabled) {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Color(0xff99BEAA)),
        ),
        padding: EdgeInsets.zero,
        fixedSize: Size(80, 56),
        backgroundColor: Color(0xffFFFFFF),
      );
    } else {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.zero,
        fixedSize: Size(80, 56),
        backgroundColor: Color(0xffE5E5E5),
      );
    }
  }

  static ButtonStyle InPreButton(bool isEnabled) {
    if (isEnabled) {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Color(0xff99BEAA)),
        ),
        fixedSize: Size(120, 40),
        backgroundColor: Color(0xffFFFFFF),
      );
    } else {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fixedSize: Size(120, 40),
        backgroundColor: Color(0xffE5E5E5),
      );
    }
  }

  static ButtonStyle StartStopButton(String isEnabled) {
    if (isEnabled == 'Start') {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fixedSize: Size(344, 56),
        backgroundColor: Color(0xff99BEAA),
      );
    } else {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Color(0xff99BEAA)),
        ),
        fixedSize: Size(344, 56),
        backgroundColor: Color(0xff848484),
      );
    }
  }
}
