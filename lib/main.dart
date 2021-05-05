import 'package:flutter/material.dart';
import 'package:my_flutter_project/journeys/auth/sign_in_screen.dart';
import 'package:my_flutter_project/theme/my_text_styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Project',
      debugShowCheckedModeBanner: false,
      theme: myThemeData,
      home: SignInScreen(),
    );
  }
}
