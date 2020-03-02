abstract class ParkomatClient {
  String get prefix;

  String mapUrl(String baseUrl) {
    List<String> parts = baseUrl.split("://");
    return "${parts[0]}://$prefix.${parts[1]}";
  }
}
