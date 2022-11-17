import 'dart:developer';
import 'package:fwc_2022/app/models/guess_model.dart';
import 'package:fwc_2022/app/repository/guess/guess_repository.dart';
import 'package:get/get.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/services/auth_services.dart';

class GuessRepositoryImpl implements GuessRepository {
  final RestClient _restClient;

  GuessRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GuessModel>> getMyGuesses(String poolId) async {
    final token = Get.find<AuthService>().getUserAccessToken();

    final response = await _restClient.get("/pools/$poolId/games", headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    });

    if (response.hasError) {
      if (response.statusCode == 401) {
        Get.find<AuthService>().logout();
      }
      log(
        'Erro ao buscar jogos e palpites ${response.body["statusCode"]}',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(response.body["error"]);
    }

    return response.body
        .map<GuessModel>((guess) => GuessModel.fromMap(guess))
        .toList();
  }

  @override
  Future<String> createGuess(
    String betId,
    String gameId,
    int firstTeamPoints,
    int secondTeamPoints,
  ) async {
    final token = Get.find<AuthService>().getUserAccessToken();

    final response =
        await _restClient.post("/pools/$betId/games/$gameId/guesses", headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    }, {
      "firstTeamPoints": firstTeamPoints,
      "secondTeamPoints": secondTeamPoints
    });

    if (response.hasError) {
      if (response.statusCode == 401) {
        Get.find<AuthService>().logout();
      }
      log(
        'Erro ao enviar palpite ${response.body["statusCode"]}',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(response.body["error"]);
    }

    return "Palpite enviado com sucesso!";
  }
}
