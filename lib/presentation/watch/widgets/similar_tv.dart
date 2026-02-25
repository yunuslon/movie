import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/bloc/generic_data_cubit.dart';
import 'package:movie/common/bloc/generic_data_state.dart';
import 'package:movie/common/widgets/tv/tv_card.dart';
import 'package:movie/domain/tv/usecases/get_similar_tvs.dart';
import 'package:movie/service_locator.dart';

class SimilarTV extends StatelessWidget {
  final int tvId;
  const SimilarTV({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GenericDataCubit()
            ..getData(sl<GetSimilarTVsUseCase>(), params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is DataLoaded) {
            if (state.data.isNotEmpty) {
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
                        return TVCard(tvEntity: state.data[index]);
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: state.data.length,
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }
          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
