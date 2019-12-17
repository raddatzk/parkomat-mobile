import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parkomat/bloc/main/main_bloc.dart';
import 'package:parkomat/generated/i18n.dart';

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

  String _buildTimestampMessage(String lastUpdated) {
    DateTime timestamp = DateTime.parse(lastUpdated.split("Last Updated: ")[1]);
    String message = DateFormat('EEEE', Localizations.localeOf(context).languageCode).add_Hms().format(timestamp);

    return S.of(context).lastUpdated + message;
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
            _buildTimestampMessage(state.stats.lastUpdated),
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
