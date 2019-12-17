import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkomat/bloc/settings/settings_bloc.dart';
import 'package:parkomat/main.dart';
import 'package:parkomat/widget/connectivity_indicator.dart';
import 'package:parkomat/widget/parkomat_header.dart';
import 'package:parkomat/widget/settings_widget.dart';

class SettingsScreen extends StatefulWidget {
  final SettingsBloc _bloc = appComponent.settingsBloc;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectivityIndicator(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Align(
              alignment: Alignment.center,
              child: BlocBuilder<SettingsBloc, SettingsState>(
                bloc: widget._bloc,
                builder: (context, state) {
                  if (state is TryBaseUrlSettingsState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is InitialSettingsState) {
                    return Container();
                  } else {
                    return Column(
                      children: <Widget>[
                        ParkomatHeader(),
                        SettingsWidget(state),
                      ],
                    );
                  }
                },
              ),
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
