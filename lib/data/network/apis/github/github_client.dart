import 'package:dio/dio.dart';
import 'package:inject/inject.dart';
import 'package:parkomat/models/parkomat/free_spot_statistics.dart';
import 'package:yaml/yaml.dart';

@provide
class GithubClient {
  GithubClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final String baseUrl = 'https://raw.githubusercontent.com/kevinraddatz/parkomat-mobile/master/';
  final Dio _dio;

  Future<String> getServerVersion() async {
    Response _result = await _dio.get('pubspec.yaml', options: RequestOptions(baseUrl: baseUrl));
    var doc = loadYaml(_result.data);
    return doc["version"];
  }

  Future<FreeSpotStatistics> getStats(String baseUrl) async {
    final Response<Map<String, dynamic>> _result = await _dio.get('/stats/free-spots', options: RequestOptions(baseUrl: baseUrl));
    return FreeSpotStatistics.fromJson(_result.data);
  }

  Future<dynamic> getHealth(String baseUrl) async {
    return _dio.get('/health', options: RequestOptions(baseUrl: baseUrl));
  }
}
