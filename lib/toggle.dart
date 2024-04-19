import 'package:flutter/material.dart';

class ToggleButtonsWidget extends StatefulWidget {
  final List<List<String>> chords;

  const ToggleButtonsWidget({Key? key, required this.chords}) : super(key: key);

  @override
  _ToggleButtonsWidgetState createState() => _ToggleButtonsWidgetState();
}

class _ToggleButtonsWidgetState extends State<ToggleButtonsWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => toggleMajorButton(widget.chords),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                    fixedSize: Size(90, 45),
                    backgroundColor: majorButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  ),
                  child: Text('Major', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => toggleMinorButton(widget.chords),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                    fixedSize: Size(90, 45),
                    backgroundColor: minorButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  ),
                  child: Text('Minor', style: TextStyle(color: Colors.white)),
                ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => toggleAugButton(widget.chords),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                    fixedSize: Size(90, 45),
                    backgroundColor: augButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  ),
                  child: Text('Aug', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => toggleDimButton(widget.chords),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                    fixedSize: Size(90, 45),
                    backgroundColor: dimButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  ),
                  child: Text('Dim', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => toggle2Button(widget.chords),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                    fixedSize: Size(90, 45),
                    backgroundColor: sus2ButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  ),
                  child: Text('Sus2', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => toggleSus4Button(widget.chords),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                    fixedSize: Size(90, 45),
                    backgroundColor: sus4ButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  ),
                  child: Text('Sus4', style: TextStyle(color: Colors.white)),
                ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => toggleM7Button(widget.chords),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                    fixedSize: Size(90, 45),
                    backgroundColor: M7ButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  ),
                  child: Text('M7', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => togglem7Button(widget.chords),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                    fixedSize: Size(90, 45),
                    backgroundColor: m7ButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  ),
                  child: Text('m7', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => toggle7Button(widget.chords),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                    fixedSize: Size(90, 45),
                    backgroundColor: sevenButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  ),
                  child: Text('7', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => togglemM7Button(widget.chords),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                    fixedSize: Size(90, 45),
                    backgroundColor: mM7ButtonEnabled ? Color(0xff9CC4AB) : Color(0xffCCE4C3),
                  ),
                  child: Text('mM7', style: TextStyle(color: Colors.white)),
                ),
              ]
          ),
        ]
    );
  }

  void toggleMajorButton(List<List<String>> chords) {
    if (chords.any((element) => element.contains('C'))) {
      chords.removeWhere((element) => element.contains('C'));
    } else {
      chords.add(
          ['C', 'F', 'Bb', 'Eb', 'Ab', 'Db', 'Gb', 'B', 'E', 'A', 'D', 'G']);
    }
    setState(() {
      majorButtonEnabled = !majorButtonEnabled;
    });

  }
  void toggleMinorButton(List<List<String>> chords) {
    if (chords.any((element) => element.contains('Cm'))) {
      chords.removeWhere((element) => element.contains('Cm'));
    } else {
      chords.add(['Cm', 'Fm', 'Bbm', 'Ebm', 'Abm', 'Dbm', 'Gbm', 'Bm', 'Em', 'Am', 'Dm', 'Gm']);
    }
    setState(() {
      minorButtonEnabled = !minorButtonEnabled;
    });
  }
  void toggleAugButton(List<List<String>> chords) {
    if (chords.any((element) => element.contains('Caug'))) {
      chords.removeWhere((element) => element.contains('Caug'));
    } else {
      chords.add(['Caug', 'Faug', 'Bbaug', 'Ebaug', 'Abaug', 'Dbaug', 'Gbaug', 'Baug', 'Eaug', 'Aaug', 'Daug', 'Gaug']);
    }
    augButtonEnabled = !augButtonEnabled;
  }
  void toggleDimButton(List<List<String>> chords) {
    if (chords.any((element) => element.contains('Cdim'))) {
      chords.removeWhere((element) => element.contains('Cdim'));
    } else {
      chords.add(['Cdim', 'Fdim', 'Bbdim', 'Ebdim', 'Abdim', 'Dbdim', 'Gbdim', 'Bdim', 'Edim', 'Adim', 'Ddim', 'Gdim']);
    }
    dimButtonEnabled = !dimButtonEnabled;
  }
  void toggle2Button(List<List<String>> chords) {
    if (chords.any((element) => element.contains('C2'))) {
      chords.removeWhere((element) => element.contains('C2'));
    } else {
      chords.add(['C2', 'F2', 'Bb2', 'Eb2', 'Ab2', 'Db2', 'Gb2', 'B2', 'E2', 'A2', 'D2', 'G2']);
    }
    sus2ButtonEnabled = !sus2ButtonEnabled;
  }
  void toggleSus4Button(List<List<String>> chords) {
    if (chords.any((element) => element.contains('Csus4'))) {
      chords.removeWhere((element) => element.contains('Csus4'));
    } else {
      chords.add(['Csus4', 'Fsus4', 'Bbsus4', 'Ebsus4', 'Absus4', 'Dbsus4', 'Gbsus4', 'Bsus4', 'Esus4', 'Asus4', 'Dsus4', 'Gsus4']);
    }
    sus4ButtonEnabled = !sus4ButtonEnabled;
  }
  void toggleM7Button(List<List<String>> chords) {
    if (chords.any((element) => element.contains('CM7'))) {
      chords.removeWhere((element) => element.contains('CM7'));
    } else {
      chords.add(['CM7', 'FM7', 'BbM7', 'EbM7', 'AbM7', 'DbM7', 'GbM7', 'BM7', 'EM7', 'AM7', 'DM7', 'GM7']);
    }
    M7ButtonEnabled = !M7ButtonEnabled;
  }
  void togglem7Button(List<List<String>> chords) {
    if (chords.any((element) => element.contains('Cm7'))) {
      chords.removeWhere((element) => element.contains('Cm7'));
    } else {
      chords.add(['Cm7', 'Fm7', 'Bbm7', 'Ebm7', 'Abm7', 'Dbm7', 'Gbm7', 'Bm7', 'Em7', 'Am7', 'Dm7', 'Gm7']);
    }
    m7ButtonEnabled = !m7ButtonEnabled;
  }
  void toggle7Button(List<List<String>> chords) {
    if (chords.any((element) => element.contains('C7'))) {
      chords.removeWhere((element) => element.contains('C7'));
    } else {
      chords.add(['C7', 'F7', 'Bb7', 'Eb7', 'Ab7', 'Db7', 'Gb7', 'B7', 'E7', 'A7', 'D7', 'G7']);
    }
    sevenButtonEnabled = !sevenButtonEnabled;
  }
  void togglemM7Button(List<List<String>> chords) {
    if (chords.any((element) => element.contains('CmM7'))) {
      chords.removeWhere((element) => element.contains('CmM7'));
    } else {
      chords.add(['CmM7', 'FmM7', 'BbmM7', 'EbmM7', 'AbmM7', 'DbmM7', 'GbmM7', 'BmM7', 'EmM7', 'AmM7', 'DmM7', 'GmM7']);
    }
    mM7ButtonEnabled = !mM7ButtonEnabled;
  }
}




