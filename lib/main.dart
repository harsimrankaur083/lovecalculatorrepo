import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:lovecalculator/screen/input_screen.dart';
import 'package:lovecalculator/screen/result_screen.dart';
import 'package:lovecalculator/screen/splash_screen.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      // initialRoute: '/',
    ));

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: <NavigatorObserver>[observer],
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/one': (context) => ScreenOne(),
        '/two': (context) => ResultScreen(),
      },
    );
  }
}
