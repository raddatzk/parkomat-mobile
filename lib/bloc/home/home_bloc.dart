import 'dart:async' show Stream;

import 'package:bloc/bloc.dart' show Bloc;
import 'package:dio/dio.dart' show DioError;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:parkomat/data/network/apis/parkomat/parkomat_core_client.dart' show ParkomatCoreClient;
import 'package:parkomat/data/sharedpref/shared_preference_cache.dart' show SharedPreferenceCache;
import 'package:parkomat/main.dart' show sl;
import 'package:parkomat/models/parkomat/free_spot_statistics.dart' show FreeSpotStatistics;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ParkomatCoreClient _parkomatCoreClient = sl<ParkomatCoreClient>();
  final SharedPreferenceCache _sharedPreferenceCache = sl<SharedPreferenceCache>();

  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is RefreshEvent) {
      yield* refreshStats(event);
    }
  }

  Stream<HomeState> refreshStats(RefreshEvent event) async* {
    String baseUrl = await _sharedPreferenceCache.getBaseUrl();
    try {
      FreeSpotStatistics stats = await _parkomatCoreClient.getStats(baseUrl);
      yield ShowStats(stats);
    } on DioError {
      yield CheckConnection();
    }
  }
}
