import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/bloc/generic_data_cubit.dart';
import 'package:movie/common/bloc/generic_data_state.dart';
import 'package:movie/core/entity/keyword.dart';
import 'package:movie/domain/tv/usecases/get_keyword.dart';
import 'package:movie/service_locator.dart';

class TvKeywords extends StatefulWidget {
  final int tvId;
  const TvKeywords({super.key, required this.tvId});

  @override
  State<TvKeywords> createState() => _TvKeywordsState();
}

class _TvKeywordsState extends State<TvKeywords> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GenericDataCubit()
            ..getData(sl<GetTVKeywordsUseCase>(), params: widget.tvId),
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

            final visibleCount = 5;
            final shouldCollapse = keyword.length > visibleCount && !isExpanded;

            final displayedItems = shouldCollapse
                ? keyword.take(visibleCount).toList()
                : keyword;

            return Wrap(
              spacing: 5,
              children: [
                ...displayedItems.map((item) => Chip(label: Text(item.name!))),

                if (shouldCollapse)
                  ActionChip(
                    label: Text('+${keyword.length - visibleCount}'),
                    onPressed: () {
                      setState(() {
                        isExpanded = true;
                      });
                    },
                  ),

                if (isExpanded && keyword.length > visibleCount)
                  ActionChip(
                    label: const Text('Show Less'),
                    onPressed: () {
                      setState(() {
                        isExpanded = false;
                      });
                    },
                  ),
              ],
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
