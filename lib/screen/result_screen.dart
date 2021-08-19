import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:lovecalculator/valentine_brain.dart';

class ResultScreen extends StatefulWidget {
  final String firstName;
  final String secondName;
  final String shortMessage;
  final String bigMessage;
  final String percentage;

  ResultScreen({
    Key key,
    this.firstName,
    this.secondName,
    this.shortMessage,
    this.bigMessage,
    this.percentage,
  }) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  CalculatorBrain brain = CalculatorBrain();

  @override
  void initState() {
    super.initState();
    analytics.setCurrentScreen(screenName: "/two");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Love Calculator',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            )),
        backgroundColor: Colors.red.shade900,
      ),
      body: Center(
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(15.0),

          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(

                  child: Text(widget.shortMessage,
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      )),
                  padding: EdgeInsets.all(10.0),
                ),
                Container(
                  child: Text(
                    widget.firstName,
                    style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.red.shade900,
                  child: Text('${widget.percentage}%',style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,),),
                ),
                Container(
                  child: Text(
                    widget.secondName,
                    style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Container(
                  child: Text(
                    widget.bigMessage,
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico"


                    ),
                    textAlign: TextAlign.center,
                  ),
                   padding: EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text('Retry',style: TextStyle(color: Colors.white),),
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  color: Colors.red.shade900,
                  onPressed: () {
                    Navigator.pop(context);
                    brain.reset();
                  },
                ),
                RaisedButton(
                  child: Text('Share',style: TextStyle(color: Colors.white),),
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  color: Colors.red.shade900,
                  onPressed: () {
                    String msg='${widget.firstName}+${widget.secondName}=${widget.percentage}%';
                    FlutterShareMe()
                        .shareToSystem( msg: msg);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
