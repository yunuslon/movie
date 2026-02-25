import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerTVState {}

class TrailerTVLoading extends TrailerTVState {}

class TrailerTVLoaded extends TrailerTVState {
  final YoutubePlayerController youtubePlayerController;
  TrailerTVLoaded({required this.youtubePlayerController});
}

class FailuerLoadTrailerTV extends TrailerTVState {
  final String errorMessage;
  FailuerLoadTrailerTV({required this.errorMessage});
}
