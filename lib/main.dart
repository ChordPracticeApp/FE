import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

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
  bool twoButtonEnabled = true;
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
  void toggle2Button() {
    setState(() {
      if (chords.any((element) => element.contains('C2'))) {
        chords.removeWhere((element) => element.contains('C2'));
      } else {
        chords.add(['C2', 'F2', 'Bb2', 'Eb2', 'Ab2', 'Db2', 'Gb2', 'B2', 'E2', 'A2', 'D2', 'G2']);
      }
      twoButtonEnabled = !twoButtonEnabled;
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
  bool InversionEnabled = true;

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

  void toggleInversionEnabledButton() {
    InversionEnabled = !InversionEnabled;
  }

  void generateRamdomInversion4(){
    if(InversionEnabled == true){
      inversion = (Random().nextInt(4) + 1).toString();
    } else{
      inversion = '';
    }
  }

  void generateRamdomInversion3(){
    if(InversionEnabled == true){
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
        previousChord = currentChord;
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
      appBar: AppBar(
        title: Text('Random Chord Generator'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container( height:1.0,
            width:500.0,
            color:Colors.transparent,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: toggleMajorButton,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(90, 45),
                  maximumSize: Size(90, 45),
                  backgroundColor: majorButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                ),
                child: Text('Major', style: TextStyle(color: Colors.white)),
              ),
              Container( height:60.0,
                width:1.0,
                color:Colors.transparent,),
              ElevatedButton(
                onPressed: toggleMinorButton,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(90, 45),
                  maximumSize: Size(90, 45),
                  backgroundColor: minorButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                ),
                child: Text('Minor', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          Container( height:1.0,
            width:500.0,
            color:Colors.transparent,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: toggleAugButton,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(90, 45),
                  maximumSize: Size(90, 45),
                  backgroundColor: augButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  //side:BorderSide(color: Colors.black),
                ),
                child: Text('Aug', style: TextStyle(color: Colors.white)),
              ),
              Container( height:60.0,
                width:1.0,
                color:Colors.transparent,),
              ElevatedButton(
                onPressed: toggleDimButton,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(90, 45),
                  maximumSize: Size(90, 45),
                  backgroundColor: dimButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  //side:BorderSide(color: Colors.black),
                ),
                child: Text('Dim', style: TextStyle(color: Colors.white)),
              ),
              Container( height:60.0,
                width:1.0,
                color:Colors.transparent,),
              ElevatedButton(
                onPressed: toggle2Button,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(90, 45),
                  maximumSize: Size(90, 45),
                  backgroundColor: twoButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  //side:BorderSide(color: Colors.black),
                ),
                child: Text('2', style: TextStyle(color: Colors.white)),
              ),
              Container( height:60.0,
                width:1.0,
                color:Colors.transparent,),
              ElevatedButton(
                onPressed: toggleSus4Button,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(90, 45),
                  maximumSize: Size(90, 45),
                  backgroundColor: sus4ButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  //side:BorderSide(color: Colors.black),
                ),
                child: Text('Sus4', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          Container( height:1.0,
            width:500.0,
            color:Colors.transparent,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: toggleM7Button,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(90, 45),
                  maximumSize: Size(90, 45),
                  backgroundColor: M7ButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  //side:BorderSide(color: Colors.black),
                ),
                child: Text('M7', style: TextStyle(color: Colors.white)),
              ),
              Container( height:60.0,
                width:1.0,
                color:Colors.transparent,),
              ElevatedButton(
                onPressed: togglem7Button,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(90, 45),
                  maximumSize: Size(90, 45),
                  backgroundColor: m7ButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  //side:BorderSide(color: Colors.black),
                ),
                child: Text('m7', style: TextStyle(color: Colors.white)),
              ),
              Container( height:60.0,
                width:1.0,
                color:Colors.transparent,),
              ElevatedButton(
                onPressed: toggle7Button,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(90, 45),
                  maximumSize: Size(90, 45),
                  backgroundColor: sevenButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  //side:BorderSide(color: Colors.black),
                ),
                child: Text('7', style: TextStyle(color: Colors.white)),
              ),
              Container( height:60.0,
                width:1.0,
                color:Colors.transparent,),
              ElevatedButton(
                onPressed: togglemM7Button,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(90, 45),
                  maximumSize: Size(90, 45),
                  backgroundColor: mM7ButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  //side:BorderSide(color: Colors.black),
                ),
                child: Text('mM7', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height:40),
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
          //SizedBox(height: 10),
          Text(
            currentChord,
            style: TextStyle(fontSize: 80),
            textAlign: TextAlign.center,
          ),

          //전위 숫자
          Text(
            inversion,
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(height: 80),
          ElevatedButton(
            onPressed : (){
              previousChord = '';
              currentChord = '';
              toggleRandomChordGenerator(); onPressedCallback();
            },
            child: Text(
              GbuttonText,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: (GbuttonText == 'Stop') ? Color(0xff9BB8D5) : Color(0xffE1DCEA)),
          ),
          SizedBox(height: 50),

          //-1, 전환 시간, +1
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE1DCEA),
                  ),
                  child: Text(
                      '-1',
                      style: TextStyle(fontSize: 20, color: Colors.black)
                  ),
                ),
                //전환 시간
                Text(
                  gTime.toString(),
                  style: TextStyle(fontSize: 50),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE1DCEA),
                  ),
                  child: Text(
                      '+1',
                      style: TextStyle(fontSize: 20, color: Colors.black)
                  ),
                ),
              ]
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: toggleInversionEnabledButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: InversionEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                ),
                child: Text('Inversion', style: TextStyle(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }
}