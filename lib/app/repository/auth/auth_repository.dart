import '../../models/user_model.dart';

abstract class AuthRepository {
  Future<TokenModel> signin(String accessToken);
}
