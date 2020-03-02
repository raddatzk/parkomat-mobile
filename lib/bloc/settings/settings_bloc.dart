import 'dart:async';

import 'package:bloc/bloc.dart' show Bloc;
import 'package:dio/dio.dart' show DioError;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show BuildContext, Navigator, TextEditingController;
import 'package:parkomat/bloc/home/home_bloc.dart' show HomeBloc, RefreshEvent;
import 'package:parkomat/data/network/apis/parkomat/parkomat_core_client.dart' show ParkomatCoreClient;
import 'package:parkomat/data/sharedpref/shared_preference_cache.dart' show SharedPreferenceCache;
import 'package:parkomat/routes.dart' show RouteBuilder, Routes;
import 'package:validators/validators.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ParkomatCoreClient _parkomatClient;
  final SharedPreferenceCache _sharedPreferenceCache;
  final HomeBloc _homeBloc;

  TextEditingController baseUrlController = new TextEditingController();

  SettingsBloc(this._parkomatClient, this._sharedPreferenceCache, this._homeBloc) {
    this.add(InitSettingsEvent());
  }

  @override
  SettingsState get initialState => InitialSettingsState();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is InitSettingsEvent) {
      baseUrlController.text = await _sharedPreferenceCache.getBaseUrl();
    }
    if (event is SetBaseUrlSettingsEvent) {
      yield Loading(true);
      String baseUrl = baseUrlController.text;
      if (isURL(baseUrl)) {
        try {
          await _parkomatClient.getHealth(baseUrl);
          await _sharedPreferenceCache.setBaseUrl(baseUrlController.text);
          _homeBloc.add(RefreshEvent());
          Navigator.pushReplacement(event.context, RouteBuilder.build(Routes.home));
          yield Loading(false);
        } on DioError {
          yield CheckConnection();
        }
      } else {
        yield CheckUrl();
      }
    }
  }
}
