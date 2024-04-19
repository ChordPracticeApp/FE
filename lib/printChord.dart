import 'dart:math';
import 'package:flutter/material.dart';

String currentChord = '';
String previousChord = '';
String inversion = '1';
bool InversionEnabled = true;
bool previousChordEnabled = true;

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

void toggleInversionEnabledButton() {
  InversionEnabled = !InversionEnabled;
}

void togglePreviousChordEnabledButton() {
  previousChordEnabled = !previousChordEnabled;
}

void generateRandomInversion4() {
  if (InversionEnabled) {
    inversion = (Random().nextInt(4)).toString();
  } else {
    inversion = '';
  }
}

void generateRandomInversion3() {
  if (InversionEnabled) {
    inversion = (Random().nextInt(3)).toString();
  } else {
    inversion = '';
  }
}

Widget buildChordDisplay() {
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
