import 'package:movie/domain/movie/entities/movie.dart';

abstract class SimilarMovieState {}

class SimilarMovieLoading extends SimilarMovieState {}

class SimilarMovieLoaded extends SimilarMovieState {
  final List<MovieEntity> movies;
  SimilarMovieLoaded({required this.movies});
}

class FailuerLoadSimilarMovie extends SimilarMovieState {
  final String errorMessage;
  FailuerLoadSimilarMovie({required this.errorMessage});
}
