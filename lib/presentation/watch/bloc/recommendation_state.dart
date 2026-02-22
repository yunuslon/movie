import 'package:movie/domain/movie/entities/movie.dart';

abstract class RecommendationMovieState {}

class RecommendationMovieLoading extends RecommendationMovieState {}

class RecommendationMovieLoaded extends RecommendationMovieState {
  final List<MovieEntity> movies;
  RecommendationMovieLoaded({required this.movies});
}

class FailuerLoadRecommendationMovie extends RecommendationMovieState {
  final String errorMessage;
  FailuerLoadRecommendationMovie({required this.errorMessage});
}
