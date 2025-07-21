import 'package:coin_cap_test/src/core/constants/api.dart';
import 'package:coin_cap_test/src/feature/coins/data/dto/data.dart';
import 'package:coin_cap_test/src/feature/coins/domain/entities/data.dart';
import 'package:coin_cap_test/src/feature/coins/domain/repo/coins_repository.dart';
import 'package:dio/dio.dart';

class CoinsRepositoryImpl extends CoinsRepository {
  final Dio _client;

  CoinsRepositoryImpl({Dio? client}) : _client = client ?? Dio();

  @override
  Future<ResponseEntity> getCoins({int? take, int? skip}) async {
    try {
      final response = await _client.get(
        '${ApiConstants.baseUrl}${ApiConstants.getCoins}',
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstants.apiKey}'},
        ),
        queryParameters: {'limit': take, 'offset': skip},
      );

      final dto = responseDTOFromJson(response.data);
      return responseEntityFromDTO(dto);
    } on DioException catch (e) {
      throw Error.throwWithStackTrace(
        e.response?.data['message'] ?? e,
        e.stackTrace,
      );
    } on Object catch (e, s) {
      throw Error.throwWithStackTrace((e), s);
    }
  }
}
