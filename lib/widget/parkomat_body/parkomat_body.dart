import 'package:flutter/material.dart';
import 'package:parkomat/bloc/main/main_bloc.dart' show LoadedMainState, LoadingMainState, MainState;
import 'package:parkomat/generated/l10n.dart' show S;
import 'package:parkomat/models/parkomat/free_spot_statistics.dart' show FreeSpotStatistics;
import 'package:parkomat/util/stats_utils/stats_utils.dart' show statsDetails;

class ParkomatBody extends StatefulWidget {
  final MainState _mainState;

  const ParkomatBody(this._mainState, {Key key}) : super(key: key);

  @override
  _ParkomatBodyState createState() => _ParkomatBodyState();
}

class _ParkomatBodyState extends State<ParkomatBody> {
  Widget _buildLoadingInitialState(LoadingMainState state) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildMainLoadedState(LoadedMainState state) {
    return Column(
      children: <Widget>[
        _buildStatsSummaryWidget(state.stats),
        _buildStatsDetailsWidget(state.stats),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget._mainState is LoadingMainState) {
      return _buildLoadingInitialState(widget._mainState);
    }
    if (widget._mainState is LoadedMainState) {
      return _buildMainLoadedState(widget._mainState);
    }
    return Container();
  }

  Widget _buildStatsSummaryWidget(FreeSpotStatistics stats) {
    return Text(
      S.of(context).parkingSpots(stats.freeSpots),
      style: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
    );
  }

  Widget _buildStatsDetailsWidget(FreeSpotStatistics stats) {
    return Text(
      statsDetails(stats, context),
      style: TextStyle(
        fontSize: 20,
        color: Colors.white70,
      ),
    );
  }
}
