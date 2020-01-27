import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

import 'constants/preferences.dart' show Preferences;

class SharedPreferenceCache {
  final Future<SharedPreferences> _sharedPreference;

  String _baseUrl;

  SharedPreferenceCache(this._sharedPreference);

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
