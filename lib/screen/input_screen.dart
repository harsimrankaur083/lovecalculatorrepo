import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:lovecalculator/constants/app_color.dart';
import 'package:lovecalculator/constants/app_string.dart';
import 'package:lovecalculator/screen/result_screen.dart';
import 'package:lovecalculator/valentine_brain.dart';

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  var _textControl1 = new TextEditingController();
  var _textControl2 = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    analytics.setCurrentScreen(screenName: "/one");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(MyString.AppName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            )),
        backgroundColor: MyColor.titleColor,
      ),
      body: Form(
        key: _formKey,
        child: LayoutBuilder(
            builder: (BuildContext context,
                BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Where There Is Great love , There Are Always   Miracles..',
                              style: TextStyle(
                                  color: Colors.red.shade900,
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20.0),
                            width: 400.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,

                              controller: _textControl1,

                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 17),
                                labelText: 'Your Name',
                                border: InputBorder.none,

                                contentPadding: EdgeInsets.all(8),


                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(20.0),
                            width: 400.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,

                              controller: _textControl2,

                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 17),
                                labelText: 'Your Crush Name',

                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(8),

                              ),
                            ),
                          ),
                          RaisedButton(
                            shape: CircleBorder(
                              side: BorderSide.none,
                            ),
                            child: Ink.image(
                              image: AssetImage("images/button.png"),
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                            onPressed: () {

                             setState(() {
                               if (_textControl1.text.isEmpty &&_textControl2.text.isEmpty) {
                                 // If the form is valid, display a snackbar. In the real world,
                                 // you'd often call a server or save the information in a database.

                                 Scaffold
                                     .of(context)
                                     .showSnackBar(SnackBar(
                                     content: Text('Please enter some Text')));
                               }
                               else {
                                 getInformation();
                               }
                             });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void getInformation() {
    CalculatorBrain brain = CalculatorBrain(
        firstName: _textControl1.text, secondName: _textControl2.text);
    String getPercentage = brain.calculateLove();
    String shortMessage = brain.shortMessage();
    String bigMessage = brain.bigMessage();
    _sendAnalyticsEvent(
      firstName: _textControl1.text,
      secondName: _textControl2.text,
      bigMessage: bigMessage,
      shortMessage: shortMessage,
      percentage: getPercentage,
    );
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ResultScreen(
                  firstName: _textControl1.text,
                  secondName: _textControl2.text,
                  bigMessage: bigMessage,
                  shortMessage: shortMessage,
                  percentage: getPercentage,
                )));
  }

  Future<void> _sendAnalyticsEvent({
    String firstName,
    String secondName,
    String shortMessage,
    String bigMessage,
    String percentage,
  }) async {
    await analytics.logEvent(
      name: 'CalculateLove_Event',
      parameters: <String, dynamic>{

        'firstName': firstName,
        'secondName': secondName,
        'shortMessage': shortMessage,
        ' bigMessage': bigMessage,
        'percentage': percentage,
      },
    );
  }
}
