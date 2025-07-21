import 'package:coin_cap_test/src/feature/coins/data/dto/data.dart';

ResponseEntity responseEntityFromDTO(ResponseDTO dto) =>
    ResponseEntity.fromDTO(dto);

class ResponseEntity {
  int? timestamp;
  List<CoinEntity>? data;

  ResponseEntity({this.timestamp, this.data});

  factory ResponseEntity.fromDTO(ResponseDTO dto) => ResponseEntity(
    timestamp: dto.timestamp,
    data: dto.data?.map(CoinEntity.fromDTO).toList(),
  );

  ResponseEntity copyWith({int? timestamp, List<CoinEntity>? data}) =>
      ResponseEntity(
        timestamp: timestamp ?? this.timestamp,
        data: data ?? this.data,
      );
}

class CoinEntity {
  String? id;
  String? symbol;
  String? name;
  String? priceUsd;

  CoinEntity({this.id, this.symbol, this.name, this.priceUsd});

  factory CoinEntity.fromDTO(CoinDTO dto) => CoinEntity(
    id: dto.id,
    symbol: dto.symbol,
    name: dto.name,
    priceUsd: dto.priceUsd,
  );
}
