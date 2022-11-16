import 'dart:developer';
import '../../core/rest_client/rest_client.dart';
import '../../core/services/auth_services.dart';
import 'find_repository.dart';

class FindRepositoryImpl implements FindRepository {
  final RestClient _restClient;

  FindRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<String> joinBet(String code) async {
    final token = AuthService.getUserAccessToken();

    final response = await _restClient.post("/pools/join", headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    }, {
      "code": code
    });

    if (response.hasError) {
      if (response.statusCode == 401) {
        AuthService.logout();
      }
      log(
        'Erro ao entrar no bolão ${response.body["statusCode"]}',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );

      AuthService.logout();

      throw RestClientException(response.body["message"]);
    }

    return "Bem-Vindo ao bolão";
  }
}
