import 'package:flutter/material.dart';
import 'package:parkomat/widget/base_url_widget/base_url_widget.dart';

class SettingsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BaseUrlWidget(),
      ],
    );
  }
}
