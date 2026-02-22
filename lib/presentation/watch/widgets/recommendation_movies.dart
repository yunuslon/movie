import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/widgets/movie/movie_card.dart';
import 'package:movie/presentation/watch/bloc/recommendation_cubit.dart';
import 'package:movie/presentation/watch/bloc/recommendation_state.dart';

class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecommendationMovieCubit()..getRecommendationMovie(movieId),
      child: BlocBuilder<RecommendationMovieCubit, RecommendationMovieState>(
        builder: (context, state) {
          if (state is RecommendationMovieLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is RecommendationMovieLoaded) {
            if (state.movies.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommendation",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MovieCard(
                          movieEntity: state.movies[index],
                          pushReplacement: true,
                        );
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
          if (state is FailuerLoadRecommendationMovie) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
