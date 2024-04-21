import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:chordpronlyfe/button_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (BuildContext context, Widget? child) => Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            title: 'Random Chord Generator',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'NotoSans',
            ),
            home: RandomChordScreen(),
          );
        },
      ),
    );
  }
}

class RandomChordScreen extends StatefulWidget {
  @override
  _RandomChordScreenState createState() => _RandomChordScreenState();
}

class _RandomChordScreenState extends State<RandomChordScreen> {
  String currentChord = '';
  String previousChord = '';

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

  bool majorButtonEnabled = true;
  bool minorButtonEnabled = true;
  bool augButtonEnabled = true;
  bool dimButtonEnabled = true;
  bool sus2ButtonEnabled = true;
  bool sus4ButtonEnabled = true;
  bool M7ButtonEnabled = true;
  bool m7ButtonEnabled = true;
  bool sevenButtonEnabled = true;
  bool mM7ButtonEnabled = true;

  void toggleMajorButton() {
    setState(() {
      if (chords.any((element) => element.contains('C'))) {
        chords.removeWhere((element) => element.contains('C'));
      } else {
        chords.add(
            ['C', 'F', 'Bb', 'Eb', 'Ab', 'Db', 'Gb', 'B', 'E', 'A', 'D', 'G']);
      }
      majorButtonEnabled = !majorButtonEnabled;
    });
  }
  void toggleMinorButton() {
    setState(() {
      if (chords.any((element) => element.contains('Cm'))) {
        chords.removeWhere((element) => element.contains('Cm'));
      } else {
        chords.add(['Cm', 'Fm', 'Bbm', 'Ebm', 'Abm', 'Dbm', 'Gbm', 'Bm', 'Em', 'Am', 'Dm', 'Gm']);
      }
      minorButtonEnabled = !minorButtonEnabled;
    });
  }
  void toggleAugButton() {
    setState(() {
      if (chords.any((element) => element.contains('Caug'))) {
        chords.removeWhere((element) => element.contains('Caug'));
      } else {
        chords.add(['Caug', 'Faug', 'Bbaug', 'Ebaug', 'Abaug', 'Dbaug', 'Gbaug', 'Baug', 'Eaug', 'Aaug', 'Daug', 'Gaug']);
      }
      augButtonEnabled = !augButtonEnabled;
    });
  }
  void toggleDimButton() {
    setState(() {
      if (chords.any((element) => element.contains('Cdim'))) {
        chords.removeWhere((element) => element.contains('Cdim'));
      } else {
        chords.add(['Cdim', 'Fdim', 'Bbdim', 'Ebdim', 'Abdim', 'Dbdim', 'Gbdim', 'Bdim', 'Edim', 'Adim', 'Ddim', 'Gdim']);
      }
      dimButtonEnabled = !dimButtonEnabled;
    });
  }
  void toggleSus2Button() {
    setState(() {
      if (chords.any((element) => element.contains('C2'))) {
        chords.removeWhere((element) => element.contains('C2'));
      } else {
        chords.add(['C2', 'F2', 'Bb2', 'Eb2', 'Ab2', 'Db2', 'Gb2', 'B2', 'E2', 'A2', 'D2', 'G2']);
      }
      sus2ButtonEnabled = !sus2ButtonEnabled;
    });
  }
  void toggleSus4Button() {
    setState(() {
      if (chords.any((element) => element.contains('Csus4'))) {
        chords.removeWhere((element) => element.contains('Csus4'));
      } else {
        chords.add(['Csus4', 'Fsus4', 'Bbsus4', 'Ebsus4', 'Absus4', 'Dbsus4', 'Gbsus4', 'Bsus4', 'Esus4', 'Asus4', 'Dsus4', 'Gsus4']);
      }
      sus4ButtonEnabled = !sus4ButtonEnabled;
    });
  }
  void toggleM7Button() {
    setState(() {
      if (chords.any((element) => element.contains('CM7'))) {
        chords.removeWhere((element) => element.contains('CM7'));
      } else {
        chords.add(['CM7', 'FM7', 'BbM7', 'EbM7', 'AbM7', 'DbM7', 'GbM7', 'BM7', 'EM7', 'AM7', 'DM7', 'GM7']);
      }
      M7ButtonEnabled = !M7ButtonEnabled;
    });
  }
  void togglem7Button() {
    setState(() {
      if (chords.any((element) => element.contains('Cm7'))) {
        chords.removeWhere((element) => element.contains('Cm7'));
      } else {
        chords.add(['Cm7', 'Fm7', 'Bbm7', 'Ebm7', 'Abm7', 'Dbm7', 'Gbm7', 'Bm7', 'Em7', 'Am7', 'Dm7', 'Gm7']);
      }
      m7ButtonEnabled = !m7ButtonEnabled;
    });
  }
  void toggle7Button() {
    setState(() {
      if (chords.any((element) => element.contains('C7'))) {
        chords.removeWhere((element) => element.contains('C7'));
      } else {
        chords.add(['C7', 'F7', 'Bb7', 'Eb7', 'Ab7', 'Db7', 'Gb7', 'B7', 'E7', 'A7', 'D7', 'G7']);
      }
      sevenButtonEnabled = !sevenButtonEnabled;
    });
  }
  void togglemM7Button() {
    setState(() {
      if (chords.any((element) => element.contains('CmM7'))) {
        chords.removeWhere((element) => element.contains('CmM7'));
      } else {
        chords.add(['CmM7', 'FmM7', 'BbmM7', 'EbmM7', 'AbmM7', 'DbmM7', 'GbmM7', 'BmM7', 'EmM7', 'AmM7', 'DmM7', 'GmM7']);
      }
      mM7ButtonEnabled = !mM7ButtonEnabled;
    });
  }

  String inversion = '1';  //전위 담당 변수
  bool inversionEnabled = true;
  bool previousChordEnabled = true;

  void generateRandomChord() {
    setState(() {
      if(chords.isNotEmpty){
        int randomIndex = Random().nextInt(chords.length);
        int randomChordIndex = Random().nextInt(chords[randomIndex].length);
        currentChord = chords[randomIndex][randomChordIndex];

        //중복제거
        while(previousChord == currentChord){
          generateRandomChord();
        }
      }
    });
  }

  void toggleinversionEnabledButton() {
    setState(() {
      inversionEnabled = !inversionEnabled;
    });

  }

  void togglePreviousChordEnabledButton(){
    setState(() {
      previousChordEnabled = !previousChordEnabled;
    });
  }

  void generateRamdomInversion4(){
    if(inversionEnabled == true){
      inversion = (Random().nextInt(4) + 1).toString();
    } else{
      inversion = '';
    }
  }

  void generateRamdomInversion3(){
    if(inversionEnabled == true){
      inversion = (Random().nextInt(3) + 1).toString();
    } else {
      inversion = '';
    }
  }

  Timer? _timer;
  int gTime = 4;
  void toggleRandomChordGenerator() {
    if (_timer != null) {
      _timer!.cancel(); // 타이머가 이미 실행 중인 경우 중지합니다.
      _timer = null;
    } else {
      _timer = Timer.periodic(Duration(seconds: gTime), (timer) {
        if(previousChordEnabled == true){
          previousChord = currentChord;
        } else{
          previousChord = '';
        }
        generateRandomChord();
        if(currentChord.contains('7')){
          generateRamdomInversion4();
        } else{
          generateRamdomInversion3();
        }
      });
    }
  }

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
    generateRandomChord();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: AppBar(
          title: Text('Random Chord Generator'),
          backgroundColor: Color(0xff99BEAA),
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //앱바 - 전위 여백
          SizedBox(
            height: 32,
            width: 390,
          ),

          //inversion, pre-chord 버튼
          SizedBox(
            width: 248,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: toggleinversionEnabledButton,
                  style: ButtonStyles.InPreButton(inversionEnabled),
                  child:
                      Text('Inversion', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox( height:40.0,
                  width:8.0,
                ),
                ElevatedButton(
                  onPressed: togglePreviousChordEnabledButton,
                  style: ButtonStyles.InPreButton(previousChordEnabled),
                  child:
                      Text('pre-chord', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ],
            ),
          ),

          //inversion - 코드 여백
          SizedBox(
            height: 56,
          ),

          //pre 코드
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                previousChord,
                style: TextStyle(fontSize: 40, color: Colors.black.withOpacity(0.8)),
              ),
              SizedBox(width: 120)
            ],
          ), */

          //현재 코드, 전위 숫자
          SizedBox(
            width: 200,
            height: 113,
            child: Column(
              children: [
                Text(
                  currentChord,
                  style: TextStyle(fontSize: 48),
                  textAlign: TextAlign.center,
                ),
                Text(
                  inversion,
                  style: TextStyle(fontSize: 24),
                ),
              ]
            )
          ),

          //코드 - 전환시간 여백
          SizedBox(height: 103),

          //-1, 전환 시간, +1
          SizedBox(
            width: 344,
            height: 56,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //-1 버튼
                  ElevatedButton(
                    onPressed: () {
                      if(gTime>=2){
                        setState(() {
                          if (_timer != null) {
                            _timer!.cancel(); // 타이머가 이미 실행 중인 경우 중지합니다.
                            _timer = null;
                          }
                          GbuttonText = 'Start';
                          gTime--;
                        });
                      }
                    },
                    style: ButtonStyles.TimeButton(),
                    child: Text(
                        '-1',
                        style: TextStyle(fontSize: 20, color: Colors.white)
                    ),
                  ),
                  //전환 시간
                  Row(
                    children: [
                      Text(
                        gTime.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        '  sec',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),

                  //+1 버튼
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_timer != null) {
                          _timer!.cancel(); // 타이머가 이미 실행 중인 경우 중지합니다.
                          _timer = null;
                        }
                        GbuttonText = 'Start';
                        gTime++;
                      });
                    },
                    style: ButtonStyles.TimeButton(),
                    child: Text(
                        '+1',
                        style: TextStyle(fontSize: 20, color: Colors.white)
                    ),
                  ),
                ]
            ),
          ),

          //전환시간 - 코드버튼 여백
          SizedBox(height: 8),

          //코드버튼 1
          SizedBox(
            width: 344,
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: toggleMajorButton,
                  style: ButtonStyles.ChordButton(majorButtonEnabled),
                  child: Text('Major', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: toggleMinorButton,
                  style:ButtonStyles.ChordButton(minorButtonEnabled),
                  child: Text('Minor', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ],
            ),
          ),

          //코드버튼 1-2 여백
          SizedBox(
            height: 8
          ),

          //코드버튼 2
          SizedBox(
            width: 344,
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: toggleAugButton,
                  style: ButtonStyles.ChordButton(augButtonEnabled),
                  child: Text('Aug', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: toggleDimButton,
                  style: ButtonStyles.ChordButton(dimButtonEnabled),
                  child: Text('Dim', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: toggleSus2Button,
                  style: ButtonStyles.ChordButton(sus2ButtonEnabled),
                  child: Text('Sus2', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: toggleSus4Button,
                  style: ButtonStyles.ChordButton(sus4ButtonEnabled),
                  child: Text('Sus4', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ],
            ),
          ),

          //코드버튼 2-3 여백
          SizedBox(
              height: 8
          ),

          //코드버튼 3
          SizedBox(
            width: 344,
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: toggleM7Button,
                  style: ButtonStyles.ChordButton(M7ButtonEnabled),
                  child: Text('M7', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: togglem7Button,
                  style: ButtonStyles.ChordButton(m7ButtonEnabled),
                  child: Text('m7', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: toggle7Button,
                  style: ButtonStyles.ChordButton(sevenButtonEnabled),
                  child: Text('7', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: togglemM7Button,
                  style: ButtonStyles.ChordButton(mM7ButtonEnabled),
                  child: Text('mM7', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          //Start,Stop 버튼
          ElevatedButton(
            onPressed : (){
              previousChord = '';
              currentChord = '';
              toggleRandomChordGenerator(); onPressedCallback();
            },
            child: Text(
              GbuttonText,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            style: ButtonStyles.StartStopButton(GbuttonText)
          ),
          ],
      ),
    );
  }
}