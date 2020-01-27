import 'package:dio/dio.dart' show Dio, RequestOptions, Response;
import 'package:parkomat/models/parkomat/free_spot_statistics.dart' show FreeSpotStatistics;

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
