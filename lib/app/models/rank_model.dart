// To parse this JSON data, do
//
//     final rankModel = rankModelFromMap(jsonString);

import 'dart:convert';

RankModel rankModelFromMap(String str) => RankModel.fromMap(json.decode(str));

String rankModelToMap(RankModel data) => json.encode(data.toMap());

class RankModel {
  RankModel({
    required this.id,
    required this.points,
    required this.userId,
    required this.poolId,
    required this.user,
  });

  String id;
  int points;
  String userId;
  String poolId;
  User user;

  factory RankModel.fromMap(Map<String, dynamic> json) => RankModel(
        id: json["id"],
        points: json["points"],
        userId: json["userId"],
        poolId: json["poolId"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "points": points,
        "userId": userId,
        "poolId": poolId,
        "user": user.toMap(),
      };
}

class User {
  User({
    required this.name,
    required this.avatarUrl,
  });

  String name;
  String avatarUrl;

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        avatarUrl: json["avatarUrl"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "avatarUrl": avatarUrl,
      };
}
