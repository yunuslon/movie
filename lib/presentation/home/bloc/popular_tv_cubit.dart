import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie/presentation/home/bloc/popular_tv_state.dart';

import 'package:movie/service_locator.dart';

class PopularTVCubit extends Cubit<PopularTVState> {
  PopularTVCubit() : super(PopularTVLoading());

  void getPopularTV() async {
    var returnedData = await sl<GetPopularTVUseCase>().call();

    returnedData.fold((error) {
        emit(FailureLoadPopularTV(errorMessage: error));
      }, (data) {
        emit(PopularTVLoaded(tv: data));
      },
    );
  }
}
