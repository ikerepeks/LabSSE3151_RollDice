import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

//Statefulwidget since image change variable
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final player = AudioCache();

  //initiate first dice asset and dice image list
  var dice1 = 'assets/dice1.png';
  var dice2 = 'assets/dice2.png';
  dynamic diceList = [
    'assets/dice1.png',
    'assets/dice2.png',
    'assets/dice3.png',
    'assets/dice4.png',
    'assets/dice5.png',
    'assets/dice6.png',
  ];

  //Generate randomizer to select dice image when pressed
  Random rnd1, rnd2;
  void changeImg1() {
    setState(() {
      int min = 0;
      int max = diceList.length - 1;
      rnd1 = new Random();
      int i = min + rnd1.nextInt(max - min);
      dice1 = diceList[i].toString();
    });
  }

  void changeImg2() {
    setState(() {
      int min = 0;
      int max = diceList.length - 1;
      rnd2 = new Random();
      int i = min + rnd2.nextInt(max - min);
      dice2 = diceList[i].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Roll Dice Apps',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Roll the Dice',
                style: TextStyle(fontFamily: 'Lobster'),
              ),
              centerTitle: true,
              backgroundColor: Colors.red[600],
            ),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/newbackground.png'),
                      fit: BoxFit.cover)),
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset('assets/diceeLogo.png'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Image.asset(dice1), Image.asset(dice2)],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          onPressed: () {
                            player.play('dice.mp3');
                            changeImg1();
                            changeImg2();
                          },
                          child: Text(
                            'Roll',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Lobster',
                            ),
                          ),
                          color: Colors.red,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
