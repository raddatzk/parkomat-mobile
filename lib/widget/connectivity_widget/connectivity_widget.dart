import 'package:connectivity_wrapper/connectivity_wrapper.dart' show ConnectivityWidgetWrapper;
import 'package:flutter/material.dart' show Alignment, BuildContext, Key, MediaQuery, StatelessWidget, Widget;
import 'package:parkomat/generated/l10n.dart' show S;

class ConnectivityWidget extends StatelessWidget {
  final Widget child;

  const ConnectivityWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2;
    double padding = MediaQuery.of(context).padding.top;
    return ConnectivityWidgetWrapper(
      alignment: Alignment(0, (padding - height) / height),
      message: S.of(context).couldNotConnect,
      child: child,
    );
  }
}
