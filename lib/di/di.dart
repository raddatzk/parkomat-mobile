import 'dart:io' show SocketException;

import 'package:dio/dio.dart' show Dio, DioError, DioErrorType, InterceptorsWrapper, LogInterceptor;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:parkomat/bloc/main/main_bloc.dart' show MainBloc;
import 'package:parkomat/bloc/settings/settings_bloc.dart' show SettingsBloc;
import 'package:parkomat/data/network/apis/github/github_client.dart' show GithubClient;
import 'package:parkomat/data/network/apis/parkomat/parkomat_client.dart' show ParkomatClient;
import 'package:parkomat/data/network/exceptions/network_exceptions.dart' show LookupException;
import 'package:parkomat/data/sharedpref/shared_preference_cache.dart' show SharedPreferenceCache;
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

Future<Dio> createDio(bool logResponseBody) async {
  return Dio()
    ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
    ..interceptors.add(InterceptorsWrapper(
      onError: (DioError e) async {
        if (e.type == DioErrorType.DEFAULT) {
          if (e.error is SocketException) {
            SocketException ex = (e.error as SocketException);
            int errorCode = ex.osError.errorCode;
            if (errorCode == 7) {
              throw new LookupException(ex.message);
            }
          }
          print(e);
        }
      },
    ))
    ..interceptors.add(LogInterceptor(responseBody: logResponseBody));
}

Future<SharedPreferenceCache> createSharedPreferenceCache() async => SharedPreferenceCache(SharedPreferences.getInstance());

void prepareClients(GetIt sl) async {
  sl.registerSingleton<Dio>(await createDio(true));
  sl.registerSingleton<ParkomatClient>(ParkomatClient(sl<Dio>()));
  sl.registerSingleton<GithubClient>(GithubClient(sl<Dio>()));
}

void prepareSharedPreferences(GetIt sl) async {
  sl.registerSingleton<SharedPreferenceCache>(await createSharedPreferenceCache());
}

void prepareBlocs(GetIt sl) async {
  sl.registerSingleton<MainBloc>(MainBloc(sl<ParkomatClient>(), sl<SharedPreferenceCache>(), sl<GithubClient>()));
  sl.registerSingleton<SettingsBloc>(SettingsBloc(sl<ParkomatClient>(), sl<SharedPreferenceCache>()));
}

void prepareDi() async {
  GetIt sl = GetIt.instance;

  await prepareClients(sl);
  await prepareSharedPreferences(sl);
  await prepareBlocs(sl);
}
