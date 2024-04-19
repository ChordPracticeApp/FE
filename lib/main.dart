import 'dart:ui';
import 'package:chordpronlyfe/toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'buttonStyle.dart';
import 'timer_buttons.dart';
import 'printChord.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Chord Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomChordScreen(),
    );
  }
}
class RandomChordScreen extends StatefulWidget {
  @override
  _RandomChordScreenState createState() => _RandomChordScreenState();
}

class _RandomChordScreenState extends State<RandomChordScreen> {
  List<List<String>> chords = [
    ['C', 'F', 'Bb', 'Eb', 'Ab', 'Db', 'Gb', 'B', 'E', 'A', 'D', 'G'],
    ['Cm', 'Fm', 'Bbm', 'Ebm', 'Abm', 'Dbm', 'Gbm', 'Bm', 'Em', 'Am', 'Dm', 'Gm'],
    ['Caug', 'Faug', 'Bbaug', 'Ebaug', 'Abaug', 'Dbaug', 'Gbaug', 'Baug', 'Eaug', 'Aaug', 'Daug', 'Gaug'],
    ['Cdim', 'Fdim', 'Bbdim', 'Ebdim', 'Abdim', 'Dbdim', 'Gbdim', 'Bdim', 'Edim', 'Adim', 'Ddim', 'Gdim'],
    ['C2', 'F2', 'Bb2', 'Eb2', 'Ab2', 'Db2', 'Gb2', 'B2', 'E2', 'A2', 'D2', 'G2'],
    ['Csus4', 'Fsus4', 'Bbsus4', 'Ebsus4', 'Absus4', 'Dbsus4', 'Gbsus4', 'Bsus4', 'Esus4', 'Asus4', 'Dsus4', 'Gsus4'],
    ['CM7', 'FM7', 'BbM7', 'EbM7', 'AbM7', 'DbM7', 'GbM7', 'BM7', 'EM7', 'AM7', 'DM7', 'GM7'],
    ['Cm7', 'Fm7', 'Bbm7', 'Ebm7', 'Abm7', 'Dbm7', 'Gbm7', 'Bm7', 'Em7', 'Am7', 'Dm7', 'Gm7'],
    ['C7', 'F7', 'Bb7', 'Eb7', 'Ab7', 'Db7', 'Gb7', 'B7', 'E7', 'A7', 'D7', 'G7'],
    ['CmM7', 'FmM7', 'BbmM7', 'EbmM7', 'AbmM7', 'DbmM7', 'GbmM7', 'BmM7', 'EmM7', 'AmM7', 'DmM7', 'GmM7'],
  ];

  Timer? _timer;
  int gTime = 4;

  String GbuttonText = 'Start';
  void onPressedCallback() {
    setState(() {
      // 현재 버튼 텍스트 확인 후 변경
      if (GbuttonText == 'Stop') {
        GbuttonText = 'Start';
      } else {
        GbuttonText = 'Stop';
      }
    });
  }

  //메인 부분
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Chord Generator'),
      ),
      body: Column(
        children: [
          ToggleButtonsWidget(chords:chords),
        ]
      ),
    );
  }
}