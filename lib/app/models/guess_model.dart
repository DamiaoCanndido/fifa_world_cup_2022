// To parse this JSON data, do
//
//     final guessModel = guessModelFromMap(jsonString);

import 'dart:convert';

GuessModel guessModelFromMap(String str) =>
    GuessModel.fromMap(json.decode(str));

String guessModelToMap(GuessModel data) => json.encode(data.toMap());

class GuessModel {
  GuessModel({
    required this.id,
    required this.date,
    required this.firstTeamCountryCode,
    required this.secondTeamCountryCode,
    this.firstTeamPoints,
    this.secondTeamPoints,
    this.guess,
    required this.isExpired,
  });

  String id;
  DateTime date;
  String firstTeamCountryCode;
  String secondTeamCountryCode;
  int? firstTeamPoints;
  int? secondTeamPoints;
  Guess? guess;
  bool isExpired;

  factory GuessModel.fromMap(Map<String, dynamic> json) => GuessModel(
      id: json["id"],
      date: DateTime.parse(json["date"]),
      firstTeamCountryCode: json["firstTeamCountryCode"],
      secondTeamCountryCode: json["secondTeamCountryCode"],
      guess: json["guess"] != null ? Guess.fromMap(json["guess"]) : null,
      isExpired: json["isExpired"],
      firstTeamPoints: json["firstTeamPoints"],
      secondTeamPoints: json["secondTeamPoints"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date.toIso8601String(),
        "firstTeamCountryCode": firstTeamCountryCode,
        "secondTeamCountryCode": secondTeamCountryCode,
        "guess": guess?.toMap(),
        "isExpired": isExpired,
        "firstTeamPoints": firstTeamPoints,
        "secondTeamPoints": secondTeamPoints
      };
}

class Guess {
  Guess({
    required this.id,
    required this.firstTeamPoints,
    required this.secondTeamPoints,
    required this.points,
    required this.createdAt,
    required this.gameId,
    required this.participantId,
  });

  String id;
  int firstTeamPoints;
  int secondTeamPoints;
  int points;
  DateTime createdAt;
  String gameId;
  String participantId;

  factory Guess.fromMap(Map<String, dynamic> json) => Guess(
        id: json["id"],
        firstTeamPoints: json["firstTeamPoints"],
        secondTeamPoints: json["secondTeamPoints"],
        createdAt: DateTime.parse(json["createdAt"]),
        gameId: json["gameId"],
        participantId: json["participantId"],
        points: json["points"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstTeamPoints": firstTeamPoints,
        "secondTeamPoints": secondTeamPoints,
        "createdAt": createdAt.toIso8601String(),
        "gameId": gameId,
        "participantId": participantId,
        "points": points,
      };
}
