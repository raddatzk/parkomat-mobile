import 'package:flutter/material.dart' show AlwaysScrollableScrollPhysics, BuildContext, Container, Key, MediaQuery, SingleChildScrollView, StatelessWidget, Widget;

class ScrollableContainer extends StatelessWidget {
  final Widget child;

  const ScrollableContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: child,
      ),
    );
  }
}
