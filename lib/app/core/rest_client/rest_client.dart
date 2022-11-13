import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class RestClient extends GetConnect {
  final String _backendBaseUrl = dotenv.env["backend_base_url"]!;

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;

  RestClientException(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
