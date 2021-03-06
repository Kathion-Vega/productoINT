import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/strings.dart';
import '../../controllers/configuration_controller.dart';
import '../../controllers/results_controller.dart';
import 'components/app_bar.dart';
import 'results/movies_results_builder.dart';
import 'results/tv_results_builder.dart';
import 'trending/trending_movies_builder.dart';
import 'trending/trending_tv_builder.dart';

class HomePage extends StatelessWidget {
  final _configurationController = Get.find<ConfigurationController>();
  final _resultsController = Get.find<ResultsController>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // appBarBuilder(),
        AppBarBuilder(),
        const SizedBox(height: 16),

        /// [trending movies]
        trendingMoviesBuilder(posterUrl: _configurationController.posterUrl),
        const SizedBox(height: 22),

        /// [trending tv shows]
        trendingTvBuilder(posterUrl: _configurationController.posterUrl),
        const SizedBox(height: 22),

        // upcoming movies *
        movieResultBuilder(
          onMoreTap: () {},
          resultType: upcomingString,
          state: _resultsController.upcommingMoviesState,
          posterUrl: _configurationController.posterUrl,
          title: "Proximos Estrenos:",
          subtitle: "Movies",
        ),
        const SizedBox(height: 22),

        // on the air tv shows
        tvResultBuilder(
          onMoreTap: () {},
          resultType: onTheAirString,
          state: _resultsController.onTheAirTvState,
          posterUrl: _configurationController.posterUrl,
          title: "En aire o streaming:",
          subtitle: "TV Series",
        ),
        const SizedBox(height: 22),

        // popular movies *
        movieResultBuilder(
          onMoreTap: () {},
          resultType: popularString,
          state: _resultsController.popularMoviesState,
          posterUrl: _configurationController.posterUrl,
          title: "Populares:",
          subtitle: "Movies",
        ),
        const SizedBox(height: 22),

        // popular tv shows
        tvResultBuilder(
          onMoreTap: () {},
          resultType: popularString,
          state: _resultsController.popularTvState,
          posterUrl: _configurationController.posterUrl,
          title: "Populares:",
          subtitle: "TV Series",
        ),
        const SizedBox(height: 22),

        // top rated movies *
        movieResultBuilder(
          onMoreTap: () {},
          resultType: topRatedString,
          state: _resultsController.topRatedMoviesState,
          posterUrl: _configurationController.posterUrl,
          title: "Las Top del Momento",
          subtitle: "Movies",
        ),
        const SizedBox(height: 22),

        // top rated tv shows
        tvResultBuilder(
          onMoreTap: () {},
          resultType: topRatedString,
          state: _resultsController.topRatedTvState,
          posterUrl: _configurationController.posterUrl,
          title: "Las Tops del Momento",
          subtitle: "TV Series",
        ),
        const SizedBox(height: 22),

        // now playing movies *
        movieResultBuilder(
          onMoreTap: () {},
          resultType: nowPlayingString,
          state: _resultsController.nowPlayingMoviesState,
          posterUrl: _configurationController.posterUrl,
          title: "En cines:",
          subtitle: "Movies",
        ),
        const SizedBox(height: 22),

        // airing today tv shows
        tvResultBuilder(
          onMoreTap: () {},
          resultType: airingTodayString,
          state: _resultsController.airingTodayTvState,
          posterUrl: _configurationController.posterUrl,
          title: "En aire o streaming:",
          subtitle: "TV Series",
        ),
        const SizedBox(height: 22),
        const SizedBox(height: 22),
      ],
    );
  }
}
