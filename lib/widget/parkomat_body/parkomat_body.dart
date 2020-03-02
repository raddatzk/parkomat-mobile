import 'package:flutter/material.dart' show BuildContext, Center, CircularProgressIndicator, Colors, Column, Container, FontWeight, State, StatefulWidget, Text, TextAlign, TextStyle, Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:parkomat/bloc/home/home_bloc.dart' show HomeBloc, HomeState, LoadingMainState, ShowStats;
import 'package:parkomat/generated/l10n.dart' show S;
import 'package:parkomat/main.dart' show sl;
import 'package:parkomat/models/parkomat/free_spot_statistics.dart' show FreeSpotStatistics;
import 'package:parkomat/util/stats_utils/stats_utils.dart' show statsDetails;

class ParkomatBody extends StatefulWidget {
  final HomeBloc _bloc = sl<HomeBloc>();

  @override
  _ParkomatBodyState createState() => _ParkomatBodyState();
}

class _ParkomatBodyState extends State<ParkomatBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: widget._bloc,
      builder: (context, state) {
        if (state is LoadingMainState) {
          return _buildLoadingInitialState(state);
        }
        if (state is ShowStats) {
          return _buildMainLoadedState(state);
        }

        return Container();
      },
    );
  }

  Widget _buildLoadingInitialState(LoadingMainState state) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildMainLoadedState(ShowStats state) {
    return Column(
      children: <Widget>[
        _buildStatsSummaryWidget(state.stats),
        _buildStatsDetailsWidget(state.stats),
      ],
    );
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
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white70,
      ),
    );
  }
}
