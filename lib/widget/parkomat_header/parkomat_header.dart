import 'package:flutter/material.dart' show BuildContext, Colors, Column, FontWeight, StatelessWidget, Text, TextAlign, TextStyle, Widget;
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
          "Parkomat",
          textAlign: TextAlign.center,
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
