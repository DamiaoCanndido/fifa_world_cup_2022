import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
    required this.user,
  });

  User user;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
      };
}

class User {
  User({
    required this.name,
    required this.avatarUrl,
    required this.sub,
  });

  String name;
  String avatarUrl;
  String sub;

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        avatarUrl: json["avatarUrl"],
        sub: json["sub"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "avatarUrl": avatarUrl,
        "sub": sub,
      };
}

TokenModel tokenModelFromMap(String str) =>
    TokenModel.fromMap(json.decode(str));

String tokenModelToMap(TokenModel data) => json.encode(data.toMap());

class TokenModel {
  TokenModel({
    required this.token,
  });

  String token;

  factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
