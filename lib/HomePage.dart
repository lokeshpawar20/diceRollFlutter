import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AssetImage> images = [
    AssetImage("images/one.png"),
    AssetImage("images/two.png"),
    AssetImage("images/three.png"),
    AssetImage("images/four.png"),
    AssetImage("images/five.png"),
    AssetImage("images/six.png")
  ];
  AssetImage diceimage, diceimage1;
  @override
  void initState() {
    super.initState();
    setState(() {
      diceimage = images[0];
      diceimage1 = images[5];
    });
  }

  void rollDice() {
    AssetImage newImage, newImage1;
    int random = Random().nextInt(6);
    int random1 = Random().nextInt(6);
    print(random);
    newImage = images[random];
    newImage1 = images[random1];
    setState(() {
      diceimage = newImage;
      diceimage1 = newImage1;
    });
  }

  void reset() {
    setState(() {
      diceimage = images[0];
      diceimage1 = images[0];
    });
  }

  void singleRoll() {
    AssetImage newImage;
    int random = Random().nextInt(6);
    print(random);
    newImage = images[random];
    setState(() {
      diceimage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  color: Colors.yellow,
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Reset Dice',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: reset,
                ),
              ),
              Padding(padding: EdgeInsets.all(30.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image(
                    image: diceimage,
                    width: 150.0,
                    height: 150.0,
                  ),
                  Padding(padding: EdgeInsets.all(30.0)),
                  Image(
                    image: diceimage1,
                    width: 150.0,
                    height: 150.0,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: RaisedButton(
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Text(
                    'Roll the Dice',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  onPressed: rollDice,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          'Roll Single',
          style: TextStyle(fontSize: 15.0),
          textAlign: TextAlign.center,
        ),
        onPressed: singleRoll,
      ),
    );
  }
}
