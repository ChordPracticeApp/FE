import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle TimeButton(Size screenSize) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      fixedSize: Size(screenSize.width * 0.205, screenSize.height * 0.066),
      backgroundColor: Color(0xff99BEAA),
    );
  }

  static ButtonStyle ChordButton(bool isEnabled, Size screenSize) {
    if (isEnabled) {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Color(0xff99BEAA)),
        ),
        padding: EdgeInsets.zero,
        fixedSize: Size(screenSize.width * 0.200, screenSize.height * 0.066),
        backgroundColor: Color(0xffFFFFFF),
      );
    } else {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.zero,
        fixedSize: Size(screenSize.width * 0.20, screenSize.height * 0.066),
        backgroundColor: Color(0xffE5E5E5),
      );
    }
  }

  static ButtonStyle InPreButton(bool isEnabled, Size screenSize) {
    if (isEnabled) {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Color(0xff99BEAA)),
        ),
        fixedSize: Size(screenSize.width * 0.305, screenSize.height * 0.047),
        backgroundColor: Color(0xffFFFFFF),
      );
    } else {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fixedSize: Size(screenSize.width * 0.300, screenSize.height * 0.047),
        backgroundColor: Color(0xffE5E5E5),
      );
    }
  }

  static ButtonStyle StartStopButton(String isEnabled, Size screenSize) {
    if (isEnabled == 'Start') {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fixedSize: Size(screenSize.width * 0.800, screenSize.height * 0.066),
        backgroundColor: Color(0xff99BEAA),
      );
    } else {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Color(0xff99BEAA)),
        ),
        fixedSize: Size(screenSize.width * 0.800, screenSize.height * 0.066),
        backgroundColor: Color(0xff848484),
      );
    }
  }
}
