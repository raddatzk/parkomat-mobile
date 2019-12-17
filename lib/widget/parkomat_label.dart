import 'package:flutter/material.dart';

class ParkomatLabel extends StatelessWidget {
  final String title;

  ParkomatLabel({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Parkom.at",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 60,
        color: Colors.white10,
      ),
    );
    ;
  }
}
