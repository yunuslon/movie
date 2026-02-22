import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/movie/usecases/get_similar_movie.dart';
import 'package:movie/presentation/watch/bloc/similar_state.dart';
import 'package:movie/service_locator.dart';

class SimilarMovieCubit extends Cubit<SimilarMovieState> {
  SimilarMovieCubit() : super(SimilarMovieLoading());

  void getSimilarMovie(int movieId) async {
    var returnedData = await sl<GetSimilarMovieUseCase>().call(
      params: movieId,
    );

    returnedData.fold(
      (error) {
        emit(FailuerLoadSimilarMovie(errorMessage: error));
      },
      (data) {
        emit(SimilarMovieLoaded(movies: data));
      },
    );
  }
}
