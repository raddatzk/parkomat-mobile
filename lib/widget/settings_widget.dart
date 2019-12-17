import 'package:flutter/material.dart';
import 'package:parkomat/bloc/settings/settings_bloc.dart';
import 'package:parkomat/generated/i18n.dart';

typedef void SetBaseUrlCallback(String baseUrl);

class SettingsWidget extends StatefulWidget {
  final SettingsState _state;

  SettingsWidget(this._state, {Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> with TickerProviderStateMixin {
  Widget buildTextField(SettingsState state) {
    if (state is LoadedSettingsState) {
      return TextField(
        controller: state.controller,
        decoration: InputDecoration(
          labelText: S.of(context).urlToParkomat,
        ),
      );
    } else if (state is InvalidBaseUrlSettingsState) {
      return TextField(
        controller: state.controller,
        decoration: InputDecoration(
          labelText: S.of(context).urlToParkomat,
          errorText: S.of(context).couldNotConnect,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: buildTextField(widget._state),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
      ],
    );
  }
}
