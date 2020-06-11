import 'package:OhMyNews/views/home.dart';
import 'package:flutter/material.dart';

void main () {
  runApp(OhMyNews());
}

class OhMyNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OhMyNews',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}

