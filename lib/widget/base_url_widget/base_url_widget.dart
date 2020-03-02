import 'package:flutter/material.dart' show BuildContext, Column, InputDecoration, MediaQuery, SizedBox, State, StatefulWidget, TextField, Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:parkomat/bloc/settings/settings_bloc.dart' show CheckConnection, CheckUrl, SettingsBloc, SettingsState;
import 'package:parkomat/generated/l10n.dart' show S;
import 'package:parkomat/main.dart' show sl;
import 'package:validators/validators.dart' show isURL;

typedef void SetBaseUrlCallback(String baseUrl);

class BaseUrlWidget extends StatefulWidget {
  final SettingsBloc _bloc = sl<SettingsBloc>();

  @override
  _BaseUrlWidgetState createState() => _BaseUrlWidgetState();
}

class _BaseUrlWidgetState extends State<BaseUrlWidget> {
  String _errorText = null;

  Widget buildTextField() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      bloc: widget._bloc,
      builder: (context, state) {
        if (state is CheckConnection) {
          _errorText = S.of(context).checkConnection;
        }
        if (state is CheckUrl) {
          _errorText = S.of(context).checkUrl;
        }

        return TextField(
          controller: widget._bloc.baseUrlController,
          decoration: InputDecoration(
            labelText: S.of(context).urlToParkomat,
            errorText: _errorText,
          ),
          onChanged: (value) {
            setState(() {
              _errorText = isURL(value) ? null : S.of(context).checkUrl;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: buildTextField(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
      ],
    );
  }
}
