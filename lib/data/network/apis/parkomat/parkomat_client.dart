import 'package:dio/dio.dart';
import 'package:inject/inject.dart';
import 'package:parkomat/models/parkomat/free_spot_statistics.dart';

@provide
class ParkomatClient {
  ParkomatClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  Future<FreeSpotStatistics> getStats(String baseUrl) async {
    final Response<Map<String, dynamic>> _result = await _dio.get('/stats/free-spots', options: RequestOptions(baseUrl: baseUrl));
    return FreeSpotStatistics.fromJson(_result.data);
  }

  Future<dynamic> getHealth(String baseUrl) async {
    return _dio.get('/health', options: RequestOptions(baseUrl: baseUrl));
  }
}
