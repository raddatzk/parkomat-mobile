class NetworkException implements Exception {
  String message;

  NetworkException({this.message});
}

class LookupException extends NetworkException {
  LookupException(String message) : super(message: message);
}
