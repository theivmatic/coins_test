import 'package:coin_cap_test/src/feature/coins/domain/entities/data.dart';

abstract class CoinsRepository {
  Future<ResponseEntity> getCoins({int? take, int? skip});
}
