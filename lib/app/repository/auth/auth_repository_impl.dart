import 'dart:developer';
import 'package:fwc_2022/app/models/user_model.dart';
import 'package:fwc_2022/app/repository/auth/auth_repository.dart';
import '../../core/rest_client/rest_client.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<UserModel> getMe(String accessToken) {
    // TODO: implement getMe
    throw UnimplementedError();
  }

  @override
  Future<TokenModel> signin(
      String id, String? displayName, String email, String? photoUrl) async {
    final response = await _restClient.post("/users", {
      "id": id,
      "displayName": displayName,
      "email": email,
      "photoUrl": photoUrl
    });

    if (response.hasError) {
      log(
        "Erro ao logar com a conta google",
        error: response.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException("Erro ao logar com a conta google");
    }
    return TokenModel.fromMap(response.body);
  }
}
