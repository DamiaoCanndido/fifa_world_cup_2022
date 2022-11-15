import 'dart:developer';
import 'package:fwc_2022/app/models/guess_model.dart';
import 'package:fwc_2022/app/repository/guess/guess_repository.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/services/auth_services.dart';

class GuessRepositoryImpl implements GuessRepository {
  final RestClient _restClient;

  GuessRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GuessModel>> getMyGuesses(String poolId) async {
    final token = AuthService.getUserAccessToken();

    final response = await _restClient.get("/pools/$poolId/games", headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    });

    if (response.hasError) {
      log(
        'Erro ao buscar jogos e palpites ${response.body["statusCode"]}',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );

      AuthService.logout();

      throw RestClientException(response.body["error"]);
    }

    return response.body
        .map<GuessModel>((guess) => GuessModel.fromMap(guess))
        .toList();
  }
}
