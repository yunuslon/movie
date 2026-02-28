import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/bloc/generic_data_cubit.dart';
import 'package:movie/common/bloc/generic_data_state.dart';
import 'package:movie/core/entity/keyword.dart';
import 'package:movie/domain/tv/usecases/get_keyword.dart';
import 'package:movie/service_locator.dart';

class TvKeywords extends StatelessWidget {
  final int tvId;
  const TvKeywords({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GenericDataCubit()..getData(sl<GetTVKeywordsUseCase>(), params: tvId),
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
            List<KeywordEntity> keyword = state.data;
            return Wrap(
              spacing: 5,
              children: keyword
                  .map((item) => Chip(label: Text(item.name!)))
                  .toList(),
            );
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
