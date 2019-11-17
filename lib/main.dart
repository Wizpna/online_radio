import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:flutter_radio/flutter_radio.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String url = "http://server-23.stream-server.nl:8438";

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioStart();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }

  Future play() async {
    await FlutterRadio.play(url: url);
    setState(() {
    });
  }

  Future pause() async{
    setState(() async{
      await FlutterRadio.pause(url: url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: new AppBar(
            title: const Text('indiexl online radio'),
            backgroundColor: Colors.purpleAccent,
            centerTitle: true,
          ),
          body: new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/originals/3b/2d/96/3b2d96c01613168b68f379329c3da809.jpg'),
                    fit: BoxFit.fill),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: RaisedButton(
                        elevation: 30,
                        color: Colors.greenAccent,
                        onPressed: isPlaying ? null : () => play(),
                        child: Icon(
                          Icons.play_circle_outline,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: RaisedButton(
                        elevation: 30,
                        color: Colors.greenAccent,
                        onPressed: () => FlutterRadio.pause(url: url),
                        child: Icon(
                          Icons.pause_circle_outline,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
