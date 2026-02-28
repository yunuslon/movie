import 'package:flutter/material.dart';
import 'package:movie/common/widgets/appbar/app_bar.dart';
import 'package:movie/domain/tv/entities/tv.dart';
import 'package:movie/presentation/watch/widgets/Video_overview.dart';
import 'package:movie/presentation/watch/widgets/tv_keywords.dart';
import 'package:movie/presentation/watch/widgets/recommendation_tv.dart';
import 'package:movie/presentation/watch/widgets/similar_tv.dart';
import 'package:movie/presentation/watch/widgets/tv_video_player.dart';
import 'package:movie/presentation/watch/widgets/video_release_date.dart';
import 'package:movie/presentation/watch/widgets/video_title.dart';
import 'package:movie/presentation/watch/widgets/video_vote_average.dart';

class TVWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TVWatchPage({required this.tvEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TVVideoPlayer(id: tvEntity.id!),
            const SizedBox(height: 16),
            VideoTitle(title: tvEntity.name!),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: tvEntity.firstAirDate!),
                VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
              ],
            ),
            const SizedBox(height: 16),
            TvKeywords(tvId: tvEntity.id!),
            const SizedBox(height: 16),
            VideoOverview(overview: tvEntity.overview!),
            const SizedBox(height: 16),
            RecommendationTV(tvId: tvEntity.id!),
            const SizedBox(height: 16),
            SimilarTV(tvId: tvEntity.id!)
          ],
        ),
      ),
    );
  }
}
