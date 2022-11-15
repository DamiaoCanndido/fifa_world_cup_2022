// To parse this JSON data, do
//
//     final betModel = betModelFromMap(jsonString);

import 'dart:convert';

BetModel betModelFromMap(String str) => BetModel.fromMap(json.decode(str));

String betModelToMap(BetModel data) => json.encode(data.toMap());

class BetModel {
  BetModel({
    required this.id,
    required this.title,
    required this.code,
    required this.createdAt,
    required this.ownerId,
    required this.participants,
    required this.owner,
    required this.count,
  });

  String id;
  String title;
  String code;
  DateTime createdAt;
  String ownerId;
  List<Participant> participants;
  Owner owner;
  Count count;

  factory BetModel.fromMap(Map<String, dynamic> json) => BetModel(
        id: json["id"],
        title: json["title"],
        code: json["code"],
        createdAt: DateTime.parse(json["createdAt"]),
        ownerId: json["ownerId"],
        participants: List<Participant>.from(
            json["participants"].map((x) => Participant.fromMap(x))),
        owner: Owner.fromMap(json["owner"]),
        count: Count.fromMap(json["_count"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "code": code,
        "createdAt": createdAt.toIso8601String(),
        "ownerId": ownerId,
        "participants": List<dynamic>.from(participants.map((x) => x.toMap())),
        "owner": owner.toMap(),
        "_count": count.toMap(),
      };
}

class Count {
  Count({
    required this.participants,
  });

  int participants;

  factory Count.fromMap(Map<String, dynamic> json) => Count(
        participants: json["participants"],
      );

  Map<String, dynamic> toMap() => {
        "participants": participants,
      };
}

class Owner {
  Owner({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory Owner.fromMap(Map<String, dynamic> json) => Owner(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "id": id,
      };
}

class Participant {
  Participant({
    required this.id,
    required this.user,
  });

  String id;
  User user;

  factory Participant.fromMap(Map<String, dynamic> json) => Participant(
        id: json["id"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user": user.toMap(),
      };
}

class User {
  User({
    required this.avatarUrl,
  });

  String avatarUrl;

  factory User.fromMap(Map<String, dynamic> json) => User(
        avatarUrl: json["avatarUrl"],
      );

  Map<String, dynamic> toMap() => {
        "avatarUrl": avatarUrl,
      };
}
