import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/constants/api_url.dart';
import 'package:movie/core/network/dio_client.dart';
import 'package:movie/service_locator.dart';

abstract class TVService {
  Future<Either> getPopularTV();
  Future<Either> getTVTrailer(int tvId);
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getSimilarTVs(int tvId);
}

class TVApiServiceImpl extends TVService {
  @override
  Future<Either> getPopularTV() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.popularTV);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either<dynamic, dynamic>> getRecommendationTVs(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either<dynamic, dynamic>> getSimilarTVs(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tv}$tvId/similar');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either<dynamic, dynamic>> getTVTrailer(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/trailers',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
