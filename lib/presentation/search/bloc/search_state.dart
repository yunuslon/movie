import 'package:movie/domain/movie/entities/movie.dart';
import 'package:movie/domain/tv/entities/tv.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MoviesLoaded extends SearchState {
  final List<MovieEntity> movies;
  MoviesLoaded({required this.movies});
}

class TVLoaded extends SearchState {
  final List<TVEntity> tv;
  TVLoaded({required this.tv});
}

class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure({required this.errorMessage});
}
