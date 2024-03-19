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
        chords.add(['C', 'F', 'Bb', 'Eb', 'Ab', 'Db', 'Gb', 'B', 'E', 'A', 'D', 'G']);
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


  void generateRandomChord() {
    setState(() {
      int randomIndex = Random().nextInt(chords.length);
      int randomChordIndex = Random().nextInt(chords[randomIndex].length);
      currentChord = chords[randomIndex][randomChordIndex];
    });
  }

  Timer? _timer;

  void toggleRandomChordGenerator() {
    if (_timer != null) {
      _timer!.cancel(); // 타이머가 이미 실행 중인 경우 중지합니다.
      _timer = null;
    } else {
      _timer = Timer.periodic(Duration(seconds: 2), (timer) {
        generateRandomChord();
      });
    }
  }

  String GbuttonText = 'Start';
  void onPressedCallback() {
    setState(() {
      // 현재 버튼 텍스트 확인 후 변경
      if (GbuttonText == 'Start') {
        GbuttonText = 'Stop';
      } else {
        GbuttonText = 'Start';
      }
    });
  }
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: toggleMajorButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: majorButtonEnabled ? Colors.black : Colors
                      .grey,
                ),
                child: Text(majorButtonEnabled ? 'Major' : 'Major'),
              ),
              ElevatedButton(
                onPressed: toggleMinorButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: minorButtonEnabled ? Colors.black : Colors
                      .grey,
                ),
                child: Text(minorButtonEnabled ? 'Minor' : 'Minor'),
              ),
              ElevatedButton(
                onPressed: toggleAugButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: augButtonEnabled ? Colors.black : Colors.grey,
                ),
                child: Text(augButtonEnabled ? 'Aug' : 'Aug'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: toggleDimButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: dimButtonEnabled ? Colors.black : Colors.grey,
                ),
                child: Text(dimButtonEnabled ? 'Dim' : 'Dim'),
              ),
              ElevatedButton(
                onPressed: toggle2Button,
                style: ElevatedButton.styleFrom(
                  backgroundColor: twoButtonEnabled ? Colors.black : Colors.grey,
                ),
                child: Text(twoButtonEnabled ? '2' : '2'),
              ),
              ElevatedButton(
                onPressed: toggleSus4Button,
                style: ElevatedButton.styleFrom(
                  backgroundColor: sus4ButtonEnabled ? Colors.black : Colors
                      .grey,
                ),
                child: Text(sus4ButtonEnabled ? 'Sus4' : 'Sus4'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: toggleM7Button,
                style: ElevatedButton.styleFrom(
                  backgroundColor: M7ButtonEnabled ? Colors.black : Colors.grey,
                ),
                child: Text(M7ButtonEnabled ? 'M7' : 'M7'),
              ),
              ElevatedButton(
                onPressed: togglem7Button,
                style: ElevatedButton.styleFrom(
                  backgroundColor: m7ButtonEnabled ? Colors.black : Colors.grey,
                ),
                child: Text(m7ButtonEnabled ? 'm7' : 'm7'),
              ),
              ElevatedButton(
                onPressed: toggle7Button,
                style: ElevatedButton.styleFrom(
                  backgroundColor: sevenButtonEnabled ? Colors.black : Colors
                      .grey,
                ),
                child: Text(sevenButtonEnabled ? '7' : '7'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: togglemM7Button,
                style: ElevatedButton.styleFrom(
                  backgroundColor: mM7ButtonEnabled ? Colors.black : Colors.grey,
                ),
                child: Text(mM7ButtonEnabled ? 'mM7' : 'mM7'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            currentChord,
            style: TextStyle(fontSize: 80),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 200),
          ElevatedButton(
            onPressed : (){toggleRandomChordGenerator(); onPressedCallback();},
            child: Text(GbuttonText),
          ),
        ],
      ),
    );
  }
}