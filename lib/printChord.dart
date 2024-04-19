import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

class PrintChordWidget extends StatefulWidget {
  final List<List<String>> chords;
  final bool inversionEnabled;
  final bool previousChordEnabled;

  const PrintChordWidget({Key? key, required this.chords, required this.inversionEnabled, required this.previousChordEnabled}) : super(key: key);

  @override
  _PrintChordWidgetState createState() => _PrintChordWidgetState();
}

class _PrintChordWidgetState extends State<PrintChordWidget>{
  String currentChord = 'Cu';
  String previousChord = 'Pr';
  String inversion = '1';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              previousChord,
              style: TextStyle(fontSize: 40, color: Colors.black.withOpacity(0.8)),
            ),
            SizedBox(width: 120)
          ],
        ),
        // 현재 코드
        Text(
          currentChord,
          style: TextStyle(fontSize: 80),
          textAlign: TextAlign.center,
        ),
        // 전위 숫자
        Text(
          inversion,
          style: TextStyle(fontSize: 40),
        ),
        SizedBox(height: 20),
        Container(
          height: 30.0,
          width: 500.0,
          color: Colors.transparent,
        ),
      ],
    );
  }

  void generateRandomInversion4() {
    if (widget.inversionEnabled) {
      inversion = (Random().nextInt(4)).toString();
    } else {
      inversion = '';
    }
  }

  void generateRandomInversion3() {
    if (widget.inversionEnabled) {
      inversion = (Random().nextInt(3)).toString();
    } else {
      inversion = '';
    }
  }

  Timer? _timer;

  void toggleRandomChordGenerator(int gTime) {
    if (_timer != null) {
      _timer!.cancel(); // 타이머가 이미 실행 중인 경우 중지합니다.
      _timer = null;
    } else {
      _timer = Timer.periodic(Duration(seconds: gTime), (timer) {
        if(widget.previousChordEnabled == true){
          previousChord = currentChord;
        } else{
          previousChord = '';
        }
        generateRandomChord(widget.chords);
        if(currentChord.contains('7')){
          generateRandomInversion4();
        } else{
          generateRandomInversion3();
        }
        setState(() { });
      });
    }
  }

  void generateRandomChord(List<List<String>> chords) {
    if (chords.isNotEmpty) {
      int randomIndex = Random().nextInt(chords.length);
      int randomChordIndex = Random().nextInt(chords[randomIndex].length);
      currentChord = chords[randomIndex][randomChordIndex];

      // 중복제거
      while (previousChord == currentChord) {
        generateRandomChord(chords);
      }
    }
  }


}


