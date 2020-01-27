import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:parkomat/data/sharedpref/shared_preference_cache.dart';
import 'package:parkomat/di/di.dart';
import 'package:parkomat/generated/i18n.dart';

import 'bloc/main/main_bloc.dart';
import 'bloc/settings/settings_bloc.dart';
import 'data/network/apis/github/github_client.dart';
import 'data/network/apis/parkomat/parkomat_client.dart';
import 'ui/home/home.dart';

GetIt sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sl.registerSingleton<Dio>(await createDio(true));
  sl.registerSingleton<ParkomatClient>(ParkomatClient(sl<Dio>()));
  sl.registerSingleton<SharedPreferenceCache>(await createSharedPreferenceCache());
  sl.registerSingleton<GithubClient>(GithubClient(sl<Dio>()));

  sl.registerSingleton<MainBloc>(MainBloc(sl<ParkomatClient>(), sl<SharedPreferenceCache>(), sl<GithubClient>()));

  sl.registerSingleton<SettingsBloc>(SettingsBloc(sl<ParkomatClient>(), sl<SharedPreferenceCache>()));

  runApp(ParkomatApp());
}

class ParkomatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Parkomat",
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: S.delegate.resolution(fallback: new Locale("en", ""), withCountry: false),
      theme: ThemeData(
        brightness: Brightness.dark,
        toggleableActiveColor: Colors.limeAccent,
        accentColor: Colors.limeAccent,
      ),
      home: HomeScreen(),
    );
  }
}
