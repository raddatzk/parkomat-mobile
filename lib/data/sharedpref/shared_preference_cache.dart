import 'dart:async';

import 'package:inject/inject.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

@provide
class SharedPreferenceCache {
  // shared pref instance
  final Future<SharedPreferences> _sharedPreference;

  String _baseUrl;

  // constructor
  SharedPreferenceCache(this._sharedPreference);

  // General Methods: ----------------------------------------------------------

  Future<String> getBaseUrl() async {
    _baseUrl = (await _sharedPreference).getString(Preferences.baseUrl);
    return _baseUrl;
  }

  Future<bool> setBaseUrl(String baseUrl) async {
    _baseUrl = baseUrl;
    return (await _sharedPreference).setString(Preferences.baseUrl, baseUrl);
  }

  Future<bool> getChangelogForVersion(String version) async {
    return (await _sharedPreference).getBool("Version $version");
  }

  Future<bool> setChangelogForVersion(String version) async {
    return (await _sharedPreference).setBool("Version $version", true);
  }
}
