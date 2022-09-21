import 'package:black_jack/home.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const black_jack());
}

class black_jack extends StatelessWidget {
  const black_jack({Key? key}) : super(key: key);
  @override //es un decorator
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vista1',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: home_game(),
    );
  }
}
