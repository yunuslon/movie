import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/widgets/movie/movie_card.dart';
import 'package:movie/presentation/watch/bloc/similar_cubit.dart';
import 'package:movie/presentation/watch/bloc/similar_state.dart';

class SimilarMovies extends StatelessWidget {
  final int movieId;
  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMovieCubit()..getSimilarMovie(movieId),
      child: BlocBuilder<SimilarMovieCubit, SimilarMovieState>(
        builder: (context, state) {
          if (state is SimilarMovieLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is SimilarMovieLoaded) {
            if (state.movies.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Similar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MovieCard(movieEntity: state.movies[index]);
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: state.movies.length,
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }
          if (state is FailuerLoadSimilarMovie) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
