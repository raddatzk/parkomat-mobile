import 'package:flutter/material.dart';
import 'package:parkomat/bloc/main/main_bloc.dart';
import 'package:parkomat/generated/i18n.dart';
import 'package:parkomat/models/parkomat/free_spot_statistics.dart';
import 'package:sprintf/sprintf.dart';

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
    int totalFreeSpots = stats.freeLiftPlaces.length + stats.freeNormalPlaces.length;

    return Text(
      sprintf("%d %s", [totalFreeSpots, S.of(context).parkingSpots]),
      style: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
    );
  }

  Widget _buildDetailedStatsWidget(FreeSpotStatistics stats) {
    int freeNormalSpots = stats.freeNormalPlaces.length;
    int freeLiftSpots = stats.freeLiftPlaces.length;
    String freeNormalSpotsDetails;
    if (freeNormalSpots == 0) {
      freeNormalSpotsDetails = "";
    } else if (freeNormalSpots == 1) {
      freeNormalSpotsDetails = S.of(context).oneStandard;
    } else {
      freeNormalSpotsDetails = sprintf("%d %s", [freeNormalSpots, S.of(context).standard]);
    }
    String freeLiftSpotsDetails;
    if (freeLiftSpots == 0) {
      freeLiftSpotsDetails = "";
    } else if (freeLiftSpots == 1) {
      freeLiftSpotsDetails = S.of(context).one;
    } else {
      freeLiftSpotsDetails = sprintf("%d %s", [freeLiftSpots, S.of(context).onTheLifts]);
    }

    return Text(
      [freeNormalSpotsDetails, freeLiftSpotsDetails].where(((details) => details != "")).join(" und "),
      style: TextStyle(
        fontSize: 20,
        color: Colors.white70,
      ),
    );
  }
}
