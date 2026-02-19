import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie/presentation/home/bloc/now_playing_state.dart';
import 'package:movie/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call();

    returnedData.fold((error) {
      emit(FailureLoadNowPlayingMovies(errorMessage: error));
    }, (data) {
      emit(NowPlayingMoviesLoaded(movies: data));
    });
  }
}
