import 'package:flutter/material.dart' show BuildContext, Container, MediaQuery, StatelessWidget, Widget;

class RelativeHeightContainer extends StatelessWidget {
  final double factor;

  RelativeHeightContainer({this.factor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * factor,
    );
  }
}
