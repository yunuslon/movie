import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/movie/usecases/get_recommendation_movie.dart';
import 'package:movie/presentation/watch/bloc/recommendation_state.dart';
import 'package:movie/service_locator.dart';

class RecommendationMovieCubit extends Cubit<RecommendationMovieState> {
  RecommendationMovieCubit() : super(RecommendationMovieLoading());

  void getRecommendationMovie(int movieId) async {
    var returnedData = await sl<GetRecommendationMovieUseCase>().call(
      params: movieId,
    );

    returnedData.fold(
      (error) {
        emit(FailuerLoadRecommendationMovie(errorMessage: error));
      },
      (data) {
        emit(RecommendationMovieLoaded(movies: data));
      },
    );
  }
}
