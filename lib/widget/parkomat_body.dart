import 'package:flutter/material.dart';
import 'package:parkomat/bloc/main/main_bloc.dart';
import 'package:parkomat/models/parkomat/free_spot_statistics.dart';
import 'package:parkomat/util/stats_utils.dart';

class ParkomatBody extends StatefulWidget {
  final MainState _mainState;

  const ParkomatBody(this._mainState, {Key key}) : super(key: key);

  @override
  _ParkomatBodyState createState() => _ParkomatBodyState();
}

class _ParkomatBodyState extends State<ParkomatBody> {
  Widget _buildMainInitialState(MainInitialState state) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildMainLoadedState(LoadedMainState state) {
    return Column(
      children: <Widget>[
        _buildFullStatsWidget(state.stats),
        _buildDetailedStatsWidget(state.stats),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget._mainState is MainInitialState) {
      return _buildMainInitialState(widget._mainState);
    }
    if (widget._mainState is LoadedMainState) {
      return _buildMainLoadedState(widget._mainState);
    }
    return Container();
  }

  Widget _buildFullStatsWidget(FreeSpotStatistics stats) {
    return Text(
      statsTitle(stats, context),
      style: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
    );
  }

  Widget _buildDetailedStatsWidget(FreeSpotStatistics stats) {
    return Text(
      statsDescription(stats, context),
      style: TextStyle(
        fontSize: 20,
        color: Colors.white70,
      ),
    );
  }
}
