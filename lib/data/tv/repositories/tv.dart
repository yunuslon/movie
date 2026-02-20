import 'package:dartz/dartz.dart';
import 'package:movie/common/helper/mapper/tv_mapper.dart';
import 'package:movie/data/tv/models/tv.dart';
import 'package:movie/data/tv/sources/tv.dart';
import 'package:movie/domain/tv/repositories/tv.dart';
import 'package:movie/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTV() async {
    var returnData = await sl<TVService>().getPopularTV();

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tvData = List.from(
          data['content'],
        ).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(tvData);
      },
    );
  }
}
