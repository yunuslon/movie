

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/entity/trailer.dart';
import 'package:movie/domain/tv/usecases/get_tv_trailer.dart';
import 'package:movie/presentation/watch/bloc/trailer_tv_state.dart';
import 'package:movie/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerTVCubit extends Cubit<TrailerTVState> {
  TrailerTVCubit() : super(TrailerTVLoading());

  void getTVTrailer(int movieId) async {
    var returnedData = await sl<GetTVTrailerUseCase>().call(params: movieId);

    returnedData.fold(
      (error) {
        emit(FailuerLoadTrailerTV(errorMessage: error));
      },
      (data) {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController _controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: const YoutubePlayerFlags(autoPlay: false),
        );
        emit(TrailerTVLoaded(youtubePlayerController: _controller));
      },
    );
  }
}
