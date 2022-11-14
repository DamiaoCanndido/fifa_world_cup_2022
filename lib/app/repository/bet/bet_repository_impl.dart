import 'dart:developer';
import 'package:fwc_2022/app/core/services/auth_services.dart';
import 'package:fwc_2022/app/models/bet_model.dart';
import 'package:fwc_2022/app/repository/bet/bet_repository.dart';
import '../../core/rest_client/rest_client.dart';

class BetRepositoryImpl implements BetRepository {
  final RestClient _restClient;

  BetRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<BetCreatedModel> createBet(String title) async {
    final token = AuthService.getUserAccessToken();

    final response = await _restClient.post("/pools", headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    }, {
      "title": title
    });

    if (response.hasError) {
      if (response.body["statusCode"] == 401) {
        AuthService.logout();
      }
      log(
        'Erro ao criar bolão ${response.body["statusCode"]}',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(response.body["error"]);
    }

    return BetCreatedModel.fromMap(response.body);
  }
}
