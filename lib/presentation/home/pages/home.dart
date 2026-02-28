import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/common/helper/navigation/app_navigation.dart';
import 'package:movie/common/widgets/appbar/app_bar.dart';
import 'package:movie/core/configs/assets/app_vectors.dart';
import 'package:movie/presentation/home/widgets/category_text.dart';
import 'package:movie/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie/presentation/home/widgets/popular_tv.dart';
import 'package:movie/presentation/home/widgets/trendings_movies.dart';
import 'package:movie/presentation/search/pages/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
          onPressed: () {
            AppNavigator.push(context, const SearchPage());
          },
          icon: Icon(Icons.search),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trendings 🔥'),
            TrendingMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Now Playing'),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Popular Tv'),
            SizedBox(height: 16),
            PopularTV(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
