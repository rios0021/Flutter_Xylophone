import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _createButton(1),
              _createButton(2),
              _createButton(3),
              _createButton(4),
              _createButton(5),
              _createButton(6),
              _createButton(7),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _createChordButton([1, 3, 5], 'C Major'),
                    _createChordButton([2, 5, 7], 'G Major'),
                    _createChordButton([1, 4, 6], 'F Major'),
                    _createChordButton([1, 3, 6], 'A Minor'),
                    _createChordButton([2, 4, 6], 'D Minor'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createButton(int soundNumber) {
    Map<int, Color> soundColor = {
      1: Colors.red,
      2: Colors.orange,
      3: Colors.yellow,
      4: Colors.green,
      5: Colors.teal,
      6: Colors.blue,
      7: Colors.purple,
    };

    return Expanded(
      child: FlatButton(
        child: Container(
          color: soundColor[soundNumber],
          // height: 100.0,
          // width: double.infinity,
        ),
        onPressed: () {
          final player = AudioCache();
          player.play('note$soundNumber.wav');
        },
      ),
    );
  }

  Widget _createChordButton(List<int> notes, String chordName) {
    // return Container(
    //     child: Center(child: Text(chordName, style: TextStyle(fontSize: 10.0),)),
    //     height: 50.0,
    //     width: 50.0,
    //     decoration: BoxDecoration(
    //       color: Colors.grey,
    //       shape: BoxShape.circle),
    //   );

    return InkWell(
      child: Container(
        padding: EdgeInsets.all(0.0),
        child: Center(
            child: Text(
          chordName,
          style: TextStyle(fontSize: 10.0),
        )),
        height: 65.0,
        width: 65.0,
        decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      ),
      onTap: () {
        final player = AudioCache();
        player.play('note${notes[0]}.wav');
        player.play('note${notes[1]}.wav');
        player.play('note${notes[2]}.wav');
      },
    );
  }
}
