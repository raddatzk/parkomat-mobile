import 'package:flutter/material.dart';

import 'relative_height_container.dart';

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
