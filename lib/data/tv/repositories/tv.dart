import 'package:dartz/dartz.dart';
import 'package:movie/common/helper/mapper/keyword.dart';
import 'package:movie/common/helper/mapper/trailer.dart';
import 'package:movie/common/helper/mapper/tv.dart';
import 'package:movie/core/models/keyword.dart';
import 'package:movie/core/models/trailer.dart';
import 'package:movie/data/tv/models/tv.dart';
import 'package:movie/data/tv/sources/tv.dart';
import 'package:movie/domain/tv/repositories/tv.dart';
import 'package:movie/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTV() async {
    var returnData = await sl<TVService>().getPopularTV();

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tvData = List.from(
          data['content'],
        ).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(tvData);
      },
    );
  }

  @override
  Future<Either<dynamic, dynamic>> getRecommendationTVs(int tvId) async {
    var returnData = await sl<TVService>().getRecommendationTVs(tvId);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(
          data['content'],
        ).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<dynamic, dynamic>> getSimilarTVs(int tvId) async {
    var returnData = await sl<TVService>().getSimilarTVs(tvId);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(
          data['content'],
        ).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<dynamic, dynamic>> getTVTrailer(int tvId) async {
    var returnData = await sl<TVService>().getTVTrailer(tvId);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tvs = List.from(data['trailers'])
            .map((item) => TrailerMapper.toEntity(TrailerModel.fromJson(item)))
            .toList();
        return Right(tvs[0]);
      },
    );
  }

  @override
  Future<Either<dynamic, dynamic>> getKeywords(int tvId) async {
    var returnData = await sl<TVService>().getKeywords(tvId);
    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var keyword = List.from(data['content'])
            .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
            .toList();
        return Right(keyword);
      },
    );
  }

  @override
  Future<Either<dynamic, dynamic>> searchTV(String query) async {
    var returnData = await sl<TVService>().searchTV(query);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => TVMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }
}
