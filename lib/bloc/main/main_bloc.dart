import 'package:bloc/bloc.dart' show Bloc;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:package_info/package_info.dart' show PackageInfo;
import 'package:parkomat/data/sharedpref/shared_preference_cache.dart' show SharedPreferenceCache;
import 'package:pub_semver/pub_semver.dart' show Version;

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final SharedPreferenceCache _sharedPreferenceCache;

  MainBloc(this._sharedPreferenceCache);

  @override
  MainState get initialState => InitialMainState();

  @override
  Stream<MainState> mapEventToState(event) async* {
    if (event is InitializeAppEvent) {
      yield* initializeApp(event);
    }
  }

  Stream<MainState> initializeApp(InitializeAppEvent event) async* {
    String baseUrl = await _sharedPreferenceCache.getBaseUrl();
    if (baseUrl == null) {
      yield SetBaseUrl();
    }

    Version currentVersion = Version.parse((await PackageInfo.fromPlatform()).version);

    Version latestVersion;
    try {
      latestVersion = Version.parse(await _sharedPreferenceCache.getVersion());
    } on ArgumentError {
      latestVersion = Version.none;
    }
    if (latestVersion < currentVersion) {
      yield ShowChangelog();
      await _sharedPreferenceCache.setVersion(currentVersion.toString());
    }
  }
}
