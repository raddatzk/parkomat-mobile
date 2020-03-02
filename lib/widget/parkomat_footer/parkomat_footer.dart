import 'package:flutter/material.dart' show BuildContext, Colors, Column, Container, Divider, EdgeInsets, MainAxisAlignment, State, StatefulWidget, Text, TextAlign, TextStyle, Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:parkomat/bloc/home/home_bloc.dart' show HomeBloc, HomeInitialState, HomeState, ShowStats;
import 'package:parkomat/main.dart' show sl;
import 'package:parkomat/util/datetime_extension/datetime_extension.dart' show DateTimeExtension;

class ParkomatFooter extends StatefulWidget {
  final HomeBloc _bloc = sl<HomeBloc>();

  @override
  _ParkomatFooterState createState() => _ParkomatFooterState();
}

class _ParkomatFooterState extends State<ParkomatFooter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: widget._bloc,
      builder: (context, state) {
        if (state is HomeInitialState) {
          return _buildMainInitialState();
        }
        if (state is ShowStats) {
          return _buildMainLoadedState(state);
        }

        return Container();
      },
    );
  }

  Widget _buildMainInitialState() {
    return Container();
  }

  Widget _buildMainLoadedState(ShowStats state) {
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
}
