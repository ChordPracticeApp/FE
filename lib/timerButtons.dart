import 'package:flutter/material.dart';
import 'buttonStyle.dart';

class TimerButtonsWidget extends StatefulWidget {
  @override
  _TimerButtonsWidgetState createState() => _TimerButtonsWidgetState();
}

class _TimerButtonsWidgetState extends State<TimerButtonsWidget> {
  int gTime = 4; // 기본 값은 4로 설정

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              gTime -= 1; // -1 버튼이 눌렸을 때 gTime 값을 감소
              if (gTime < 1) {
                gTime = 1; // gTime이 1보다 작아지면 최소값인 1로 설정
              }
            });
          },
          style: ButtonStyles.FixedButtonStyle,
          child: Text(
            '-1',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        Text(
          gTime.toString(),
          style: TextStyle(fontSize: 50),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              gTime += 1; // +1 버튼이 눌렸을 때 gTime 값을 증가
            });
          },
          style: ButtonStyles.FixedButtonStyle,
          child: Text(
            '+1',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
