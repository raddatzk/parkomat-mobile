import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inject/inject.dart';
import 'package:parkomat/data/network/exceptions/network_exceptions.dart';
import 'package:parkomat/data/sharedpref/shared_preference_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
class ParkomatModule {
  @provide
  @singleton
  @asynchronous
  Future<SharedPreferences> provideSharedPreferences() async => await SharedPreferences.getInstance();

  @provide
  @singleton
  SharedPreferenceCache provideSharedPreferenceCache() => SharedPreferenceCache(provideSharedPreferences());

  @asynchronous
  @provide
  @singleton
  Future<Dio> provideDio() async {
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
      ..interceptors.add(LogInterceptor(responseBody: true));
  }
}
