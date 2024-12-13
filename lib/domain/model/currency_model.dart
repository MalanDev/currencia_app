// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) =>
    CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
  final Meta meta;
  final Map<String, Currency> data;

  CurrencyModel({
    required this.meta,
    required this.data,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        meta: Meta.fromJson(json["meta"]),
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": Map.from(data)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Currency {
  final String code;
  final double value;

  Currency({
    required this.code,
    required this.value,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "value": value,
      };
}

class Meta {
  final DateTime lastUpdatedAt;

  Meta({
    required this.lastUpdatedAt,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        lastUpdatedAt: DateTime.parse(json["last_updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "last_updated_at": lastUpdatedAt.toIso8601String(),
      };
}
