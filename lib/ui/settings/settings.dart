import 'package:flutter/material.dart' show Align, Alignment, BuildContext, Center, CircularProgressIndicator, Column, FloatingActionButton, Icon, Icons, Scaffold, State, StatefulWidget, Widget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkomat/bloc/settings/settings_bloc.dart' show Loading, SetBaseUrlSettingsEvent, SettingsBloc, SettingsState;
import 'package:parkomat/main.dart' show sl;
import 'package:parkomat/widget/connectivity_widget/connectivity_widget.dart';
import 'package:parkomat/widget/parkomat_header/parkomat_header.dart' show ParkomatHeader;
import 'package:parkomat/widget/scrollable_container/scrollable_container.dart';
import 'package:parkomat/widget/settings_body/settings_body.dart';

class SettingsScreen extends StatefulWidget {
  final SettingsBloc _bloc = sl<SettingsBloc>();

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectivityWidget(
        child: ScrollableContainer(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                ParkomatHeader(),
                BlocBuilder<SettingsBloc, SettingsState>(
                  bloc: widget._bloc,
                  builder: (context, state) {
                    if (state is Loading && state.loading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SettingsBody();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget._bloc.add(SetBaseUrlSettingsEvent(context)),
        child: Icon(Icons.save),
      ),
    );
  }
}
