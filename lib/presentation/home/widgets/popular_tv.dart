import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/widgets/tv/tv_card.dart';
import 'package:movie/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:movie/presentation/home/bloc/popular_tv_state.dart';

class PopularTV extends StatelessWidget {
  const PopularTV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTVCubit()..getPopularTV(),
      child: BlocBuilder<PopularTVCubit, PopularTVState>(
        builder: (context, state) {
          if (state is PopularTVLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is PopularTVLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                return TVCard(tvEntity: state.tv[index]);
              },
              separatorBuilder: (context, index)=>SizedBox(width: 10),
              itemCount: state.tv.length,
              ),
            );
          }
          if (state is FailureLoadPopularTV) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
