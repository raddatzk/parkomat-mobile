import 'dart:async';

import 'package:bloc/bloc.dart' show Bloc;
import 'package:dio/dio.dart' show DioError;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:open_file/open_file.dart' show OpenFile;
import 'package:package_info/package_info.dart' show PackageInfo;
import 'package:parkomat/data/network/apis/github/github_client.dart' show GithubClient;
import 'package:parkomat/data/network/apis/parkomat/parkomat_client.dart' show ParkomatClient;
import 'package:parkomat/data/sharedpref/shared_preference_cache.dart' show SharedPreferenceCache;
import 'package:parkomat/models/parkomat/free_spot_statistics.dart' show FreeSpotStatistics;
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final ParkomatClient _parkomatClient;
  final SharedPreferenceCache _sharedPreferenceCache;
  final GithubClient _githubClient;

  MainBloc(this._parkomatClient, this._sharedPreferenceCache, this._githubClient) {
    this.add(InitMainEvent());
  }

  @override
  MainState get initialState => MainInitialState();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    try {
      if (event is UiMainEvent) {
        yield* handleUiEvent();
      }
      if (event is InitMainEvent) {
        yield* handleInitialization(event);
      }
      if (event is RefreshMainEvent) {
        yield* handleRefresh();
      }
      if (event is UpdateApkMainEvent) {
        yield* handleUpdateApk();
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        yield Error404MainState();
      }
    }
  }

  Stream<MainState> handleInitialization(InitMainEvent event) async* {
    String baseUrl = await _sharedPreferenceCache.getBaseUrl();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    bool changelog = await _sharedPreferenceCache.getChangelogForVersion(packageInfo.version);
    if (changelog == null) {
      yield ShowChangelogMainState((await _githubClient.release).body);
      _sharedPreferenceCache.setChangelogForVersion(packageInfo.version);
    }
    if (baseUrl == null) {
      yield UnsetMainState();
    } else {
      yield LoadingMainState();
      FreeSpotStatistics stats = await _parkomatClient.getStats(baseUrl);
      yield LoadedMainState(stats, baseUrl);
    }
  }

  Stream<MainState> handleUpdateApk() async* {
    yield LoadingMainState();
    var tempDir = await getApplicationDocumentsDirectory();
    await _githubClient.downloadApk(tempDir.path);
    await OpenFile.open("${tempDir.path}/parkomat.apk");
    yield* handleRefresh();
  }

  Stream<MainState> handleRefresh() async* {
    String baseUrl = await _sharedPreferenceCache.getBaseUrl();
    FreeSpotStatistics stats = await _parkomatClient.getStats(baseUrl);
    yield LoadedMainState(stats, baseUrl);
  }

  Stream<MainState> handleUiEvent() async* {
    String remoteVersion = await _githubClient.getServerVersion();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    if (version != remoteVersion) {
      yield OutdatedVersionMainState(remoteVersion);
    }
  }
}
