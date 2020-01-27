import 'package:dio/dio.dart';
import 'package:parkomat/models/github/asset.dart';
import 'package:parkomat/models/github/release.dart';
import 'package:parkomat/models/parkomat/free_spot_statistics.dart';

class GithubClient {
  GithubClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  Release _release;
  final Dio _dio;

  Future<Release> getLatestRelease() async {
    Response response = await _dio.get("https://api.github.com/repos/kevinraddatz/parkomat-mobile/releases/latest");
    return Release.fromJson(response.data);
  }

  Future<Release> get release async {
    if (_release == null) {
      _release = await getLatestRelease();
    }

    return _release;
  }

  Future<String> getServerVersion() async {
    return (await release).name.split(' ')[1];
  }

  downloadApk(String storagePath) async {
    Asset asset = (await release).assets.firstWhere((a) => a.contentType == "application/vnd.android.package-archive");
    await _dio.download(
      asset.url,
      "$storagePath/parkomat.apk",
    );
  }

  Future<FreeSpotStatistics> getStats(String baseUrl) async {
    final Response<Map<String, dynamic>> _result = await _dio.get('/stats/free-spots', options: RequestOptions(baseUrl: baseUrl));
    return FreeSpotStatistics.fromJson(_result.data);
  }

  Future<dynamic> getHealth(String baseUrl) async {
    return _dio.get('/health', options: RequestOptions(baseUrl: baseUrl));
  }
}
