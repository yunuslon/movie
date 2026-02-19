import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/common/widgets/appbar/app_bar.dart';
import 'package:movie/core/configs/assets/app_vectors.dart';
import 'package:movie/presentation/home/widgets/trending.dart';
import 'package:movie/presentation/home/widgets/trending_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingText(),
            TrendingMovies()
          ],
        ),
      ),
    );
  }
}
