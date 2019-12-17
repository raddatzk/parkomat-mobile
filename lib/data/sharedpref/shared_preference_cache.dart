import 'dart:async';
import 'dart:convert';

import 'package:inject/inject.dart';
import 'package:parkomat/models/parkomat/free_spot_statistics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

@provide
class SharedPreferenceCache {
  // shared pref instance
  final Future<SharedPreferences> _sharedPreference;

  String _baseUrl;
  FreeSpotStatistics _stats;

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

  Future<FreeSpotStatistics> getStats() async {
    String stats = (await _sharedPreference).getString(Preferences.stats);
    return stats == null ? stats : FreeSpotStatistics.fromJson(jsonDecode(stats));
  }

  Future<bool> setFreeSpotStatistics(FreeSpotStatistics stats) async {
    _stats = stats;
    return (await _sharedPreference).setString(Preferences.stats, jsonEncode(stats.toJson()));
  }
}
