import '../../models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> getMe(String accessToken);

  Future<TokenModel> signin(String accessToken);
}
