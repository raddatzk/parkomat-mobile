import 'dart:io';

import 'package:dio/dio.dart';
import 'package:parkomat/data/network/exceptions/network_exceptions.dart';
import 'package:parkomat/data/sharedpref/shared_preference_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
