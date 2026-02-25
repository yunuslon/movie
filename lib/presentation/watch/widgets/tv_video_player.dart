
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/watch/bloc/trailer_tv_cubit.dart';
import 'package:movie/presentation/watch/bloc/trailer_tv_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TVVideoPlayer extends StatelessWidget {
  final int id;
  const TVVideoPlayer({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerTVCubit()..getTVTrailer(id),
      child: BlocBuilder<TrailerTVCubit, TrailerTVState>(
        builder: (context, state) {
          if (state is TrailerTVLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is TrailerTVLoaded) {
            return YoutubePlayer(
              controller: state.youtubePlayerController,
              showVideoProgressIndicator: true,
            );
          }
          if (state is FailuerLoadTrailerTV) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }
}
