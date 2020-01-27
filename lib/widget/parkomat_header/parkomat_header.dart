import 'package:flutter/material.dart';
import 'package:parkomat/widget/relative_height_container/relative_height_container.dart' show RelativeHeightContainer;

class ParkomatHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RelativeHeightContainer(
          factor: 0.2,
        ),
        Text(
          "Parkom.at",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 60,
            color: Colors.white10,
          ),
        ),
        RelativeHeightContainer(
          factor: 0.1,
        ),
      ],
    );
  }
}
