import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

import 'constants/preferences.dart' show Preferences;

class SharedPreferenceCache {
  final Future<SharedPreferences> _sharedPreference;

  String _baseUrl;
  String _version;

  SharedPreferenceCache(this._sharedPreference);

  Future<String> getBaseUrl() async {
    if (_baseUrl == null) {
      _baseUrl = (await _sharedPreference).getString(Preferences.baseUrl);
    }
    return _baseUrl;
  }

  Future<bool> setBaseUrl(String baseUrl) async {
    _baseUrl = baseUrl;
    return (await _sharedPreference).setString(Preferences.baseUrl, baseUrl);
  }

  Future<String> getVersion() async {
    if (_version == null) {
      _version = (await _sharedPreference).getString(Preferences.version);
    }
    return _version;
  }

  Future<bool> setVersion(String version) async {
    _version = version;
    return (await _sharedPreference).setString(Preferences.version, version);
  }
}
