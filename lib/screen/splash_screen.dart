import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:lovecalculator/screen/input_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, openNextPage);
  }

  void openNextPage() {
    Route route = MaterialPageRoute(builder: (context) => ScreenOne());
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                backgroundImage: AssetImage("images/icon.jpg"),
              ),
            ),
            Text(
              'Love Calculator',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ShadowsIntoLight"),
            ),
          ],
        ));
  }
}
