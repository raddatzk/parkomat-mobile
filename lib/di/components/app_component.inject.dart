import 'app_component.dart' as _i1;
import '../modules/parkomat_module.dart' as _i2;
import 'package:dio/src/dio.dart' as _i3;
import '../../data/sharedpref/shared_preference_cache.dart' as _i4;
import 'dart:async' as _i5;
import '../../main.dart' as _i6;
import '../../data/network/apis/parkomat/parkomat_client.dart' as _i7;
import '../../bloc/main/main_bloc.dart' as _i8;
import '../../bloc/settings/settings_bloc.dart' as _i9;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._parkomatModule);

  final _i2.ParkomatModule _parkomatModule;

  _i3.Dio _dio;

  _i4.SharedPreferenceCache _singletonSharedPreferenceCache;

  static _i5.Future<_i1.AppComponent> create(
      _i2.ParkomatModule parkomatModule) async {
    final injector = AppComponent$Injector._(parkomatModule);
    injector._dio = await injector._parkomatModule.provideDio();
    return injector;
  }

  _i6.ParkomatApp _createParkomatApp() => _i6.ParkomatApp();
  _i7.ParkomatClient _createParkomatClient() =>
      _i7.ParkomatClient(_createDio());
  _i3.Dio _createDio() => _dio;
  _i8.MainBloc _createMainBloc() =>
      _i8.MainBloc(_createParkomatClient(), _createSharedPreferenceCache());
  _i4.SharedPreferenceCache _createSharedPreferenceCache() =>
      _singletonSharedPreferenceCache ??=
          _parkomatModule.provideSharedPreferenceCache();
  _i9.SettingsBloc _createSettingsBloc() =>
      _i9.SettingsBloc(_createParkomatClient(), _createSharedPreferenceCache());
  @override
  _i6.ParkomatApp get app => _createParkomatApp();
  @override
  _i7.ParkomatClient get parkomatClient => _createParkomatClient();
  @override
  _i8.MainBloc get mainBloc => _createMainBloc();
  @override
  _i9.SettingsBloc get settingsBloc => _createSettingsBloc();
}
