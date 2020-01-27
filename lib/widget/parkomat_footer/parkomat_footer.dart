import 'package:flutter/material.dart';
import 'package:parkomat/bloc/main/main_bloc.dart' show LoadedMainState, MainInitialState, MainState;
import 'package:parkomat/util/datetime_extension/datetime_extension.dart' show DateTimeExtension;

class ParkomatFooter extends StatefulWidget {
  final MainState _mainState;

  ParkomatFooter(this._mainState, {Key key}) : super(key: key);

  @override
  _ParkomatFooterState createState() => _ParkomatFooterState();
}

class _ParkomatFooterState extends State<ParkomatFooter> {
  Widget _buildMainInitialState() {
    return Container();
  }

  Widget _buildMainLoadedState(LoadedMainState state) {
    return Container(
      padding: EdgeInsets.only(bottom: 8.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Divider(
            color: Colors.limeAccent,
          ),
          Text(
            state.stats.lastUpdated.formatLastUpdated(context),
            style: TextStyle(
              fontSize: 15,
              color: Colors.white70,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget._mainState is MainInitialState) {
      return _buildMainInitialState();
    }
    if (widget._mainState is LoadedMainState) {
      return _buildMainLoadedState(widget._mainState);
    }
    return Container();
  }
}
