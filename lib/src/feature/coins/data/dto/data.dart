import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

ResponseDTO responseDTOFromJson(Map<String, dynamic> json) =>
    ResponseDTO.fromJson(json);

@JsonSerializable()
class ResponseDTO {
  int? timestamp;
  List<CoinDTO>? data;

  ResponseDTO({this.timestamp, this.data});

  factory ResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ResponseDTOFromJson(json);
}

@JsonSerializable()
class CoinDTO {
  String? id;
  String? rank;
  String? symbol;
  String? name;
  String? supply;
  String? maxSupply;
  String? marketCapUsd;
  String? volumeUsd24Hr;
  String? priceUsd;
  String? changePercent24Hr;
  String? vwap24Hr;
  String? explorer;
  Map<String, List<String>>? tokens;

  CoinDTO({
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
    this.explorer,
    this.tokens,
  });

  factory CoinDTO.fromJson(Map<String, dynamic> json) =>
      _$CoinDTOFromJson(json);
}
