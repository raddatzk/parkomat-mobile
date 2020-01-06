import 'package:inject/inject.dart';
import 'package:parkomat/bloc/main/main_bloc.dart';
import 'package:parkomat/bloc/settings/settings_bloc.dart';
import 'package:parkomat/data/network/apis/github/github_client.dart';
import 'package:parkomat/data/network/apis/parkomat/parkomat_client.dart';
import 'package:parkomat/di/modules/parkomat_module.dart';
import 'package:parkomat/main.dart';

import 'app_component.inject.dart' as g;

/// The top level injector that stitches together multiple app features into
/// a complete app.
@Injector([ParkomatModule])
abstract class AppComponent {
  @provide
  ParkomatApp get app;

  @provide
  ParkomatClient get parkomatClient;

  @provide
  GithubClient get githubClient;

  @provide
  @singleton
  MainBloc get mainBloc;

  @provide
  @singleton
  SettingsBloc get settingsBloc;

  static Future<AppComponent> create(ParkomatModule parkomatModule) {
    return g.AppComponent$Injector.create(parkomatModule);
  }
}
