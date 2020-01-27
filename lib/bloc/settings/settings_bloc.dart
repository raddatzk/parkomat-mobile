import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:parkomat/data/network/apis/parkomat/parkomat_client.dart';
import 'package:parkomat/data/sharedpref/shared_preference_cache.dart';
import 'package:parkomat/routes.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ParkomatClient _parkomatClient;
  final SharedPreferenceCache _sharedPreferenceCache;

  TextEditingController _baseUrlController;

  SettingsBloc(this._parkomatClient, this._sharedPreferenceCache) {
    this.add(InitSettingsEvent());
  }

  @override
  SettingsState get initialState => InitialSettingsState();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is InitSettingsEvent) {
      String baseUrl = await _sharedPreferenceCache.getBaseUrl();
      _baseUrlController = TextEditingController(text: baseUrl);
      yield LoadedSettingsState(_baseUrlController);
    }
    if (event is SetBaseUrlSettingsEvent) {
      yield TryBaseUrlSettingsState();
      try {
//        await _parkomatClient.getHealth(_baseUrlController.text);
        await _parkomatClient.getStats(_baseUrlController.text);
        await _sharedPreferenceCache.setBaseUrl(_baseUrlController.text);
        Navigator.pushReplacement(event.context, RouteBuilder.build(event.context, Routes.home));
      } on DioError {
        yield InvalidBaseUrlSettingsState(_baseUrlController);
      }
    }
  }
}
