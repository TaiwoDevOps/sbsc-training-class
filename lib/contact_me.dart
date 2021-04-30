import 'package:flutter/material.dart';

class ContactMePage extends StatefulWidget {
  @override
  _ContactMePageState createState() => _ContactMePageState();
}

class _ContactMePageState extends State<ContactMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            true, //This will automatically provide us a Navigator.pop(context) //method

        title: Text(
          "Contact Me",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
