import 'package:flutter/material.dart';
import 'package:test_app/my_app_home.dart';
import 'package:test_app/style.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //state the application state either (development or production ready)
      debugShowCheckedModeBanner: false,
      //Styling the app from the root using the THEME widget
      theme: myStyleData,
      //Using the scaffold to better build our app by leveraging the available properties
      home: MyAppHome(),
    );
  }
}
