import 'dart:convert';

BetCreatedModel betModelFromMap(String str) =>
    BetCreatedModel.fromMap(json.decode(str));

String betModelToMap(BetCreatedModel data) => json.encode(data.toMap());

class BetCreatedModel {
  BetCreatedModel({
    required this.code,
  });

  String code;

  factory BetCreatedModel.fromMap(Map<String, dynamic> json) => BetCreatedModel(
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
      };
}
