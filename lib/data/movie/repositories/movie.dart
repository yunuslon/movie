import 'package:dartz/dartz.dart';
import 'package:movie/common/helper/mapper/movie_mapper.dart';
import 'package:movie/data/movie/models/movie.dart';
import 'package:movie/data/movie/sources/movie.dart';
import 'package:movie/domain/movie/repositories/movie.dart';
import 'package:movie/service_locator.dart';

class MovieRepositoryImp extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnData = await sl<MovieService>().getTrendingMovies();

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<dynamic, dynamic>> getNowPlayingMovies() async {
    var returnData = await sl<MovieService>().getNowPlayingMovies();

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }
}
