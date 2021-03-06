// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:lanes/splash_screen.dart';
import 'package:lanes/src/routes/route_const_str.dart';
import 'package:lanes/src/views/auth/auth_page.dart';
import 'package:lanes/src/views/auth/components/webview_request_authorization.dart';
import 'package:lanes/src/views/dashboard/dashboard.dart';
import 'package:lanes/src/views/details/components/backdrop_preview.dart';
import 'package:lanes/src/views/details/components/backdrops_viewer.dart';
import 'package:lanes/src/views/details/components/poster_preview.dart';
import 'package:lanes/src/views/details/components/poster_viewer.dart';
import 'package:lanes/src/views/details/episode_details/episode_crew/episode_crew_page.dart';
import 'package:lanes/src/views/details/episode_details/episode_details.dart';
import 'package:lanes/src/views/details/episode_details/guest_casts/episode_guest_stars_list.dart';
import 'package:lanes/src/views/details/movie_deatils/movie_deatils.dart';
import 'package:lanes/src/views/details/movie_deatils/tabs/about/components/movie_crew_page.dart';
import 'package:lanes/src/views/details/movie_deatils/tabs/movie%20_list/collections_list.dart';
import 'package:lanes/src/views/details/people_details/people_details.dart';
import 'package:lanes/src/views/details/season_details/season_details.dart';
import 'package:lanes/src/views/details/tv_details/tabs/about/components/tv_crew_page.dart';
import 'package:lanes/src/views/details/tv_details/tv_details.dart';
import 'package:lanes/src/views/home/lists/movies/movie_result_list.dart';
import 'package:lanes/src/views/home/lists/movies/trending_movie_list.dart';
import 'package:lanes/src/views/home/lists/tv/trending_tv_list.dart';
import 'package:lanes/src/views/home/lists/tv/tv_result_list.dart';
import 'package:lanes/src/views/home/search/search.dart';
import 'package:lanes/src/views/profile/components/user_profile.dart';
import 'package:lanes/src/views/profile/profile_page.dart';

class Routes {
  static List<GetPage> getRoutes() {
    return [
      GetPage(
        name: RoutesPath.dashboardRoute,
        page: () => DashboardPage(),
        // middlewares: [AuthMiddleware()],
      ),
      GetPage(
          name: RoutesPath.splashScreenRoute, page: () => const SplashScreen()),
      GetPage(
          name: RoutesPath.movieDetailsRoute,
          page: () => MoviesDetails(movieId: Get.parameters['movieId'] ?? '')),
      GetPage(name: RoutesPath.tvDetailsRoute, page: () => TvDetails()),
      GetPage(name: RoutesPath.peopleDetailsRoute, page: () => PeopleDetails()),
      GetPage(name: RoutesPath.seasonDetailsRoute, page: () => SeasonDetails()),
      GetPage(
          name: RoutesPath.episodeDetailsRoute, page: () => EpisodeDetails()),
      GetPage(
          name: RoutesPath.episodeCrewRoute,
          page: () => EpisodeCrewPage(
              seasonNumber: Get.parameters['season_number'] ?? "0")),
      GetPage(name: RoutesPath.tvCrewRoute, page: () => TvCrewPage()),
      GetPage(name: RoutesPath.movieCrewRoute, page: () => MovieCrewPage()),
      GetPage(
          name: RoutesPath.guestStarsRoute,
          page: () => GuestStarsList(
              seasonNumber: Get.parameters['season_number'] ?? "0")),
      GetPage(
          name: RoutesPath.trendingMoviesListRoute,
          page: () => HomeTrendingMovieList(
                title: Get.arguments['title'],
                toggleOption: Get.arguments['toggleOption'],
              )),
      GetPage(
          name: RoutesPath.movieResultsListRoute,
          page: () => HomeMovieresultsList(
              state: Get.arguments['state'],
              title: Get.arguments['title'],
              resultType: Get.arguments['resultType'] ?? '')),
      GetPage(
          name: RoutesPath.trendingTvListRoute,
          page: () => HomeTrendingTvList(
                title: Get.arguments['title'],
                toggleOption: Get.arguments['toggleOption'],
              )),
      GetPage(
          name: RoutesPath.tvResultsListRoute,
          page: () => HomeTvResultList(
              state: Get.arguments['state'],
              title: Get.arguments['title'],
              resultType: Get.arguments['resultType'] ?? '')),
      GetPage(
          name: RoutesPath.authorizationRoute,
          page: () => const AuthorizeRequestToken()),
      GetPage(name: RoutesPath.authRoute, page: () => const AuthPage()),
      GetPage(
          name: RoutesPath.movieCollectionListRoute,
          page: () => MoviesCollectionList(
              collectionId: Get.arguments['collection_id'])),
      GetPage(
          name: RoutesPath.posterViewerRoute, page: () => const PosterViewer()),
      GetPage(
          name: RoutesPath.backdropViewerRoute,
          page: () => const BackdropsViewer()),
      GetPage(
          name: RoutesPath.posterPreviewRoute,
          page: () => PosterPreview(filePath: Get.arguments['filePath'])),
      GetPage(
          name: RoutesPath.backdropPreviewRoute,
          page: () => BackdropPreview(filePath: Get.arguments['filePath'])),
      GetPage(
        name: RoutesPath.searchRoute,
        page: () => SearchPage(),
        fullscreenDialog: true,
        curve: Curves.ease,
      ),
      GetPage(name: RoutesPath.profileRoute, page: () => ProfilePage()),
      GetPage(name: RoutesPath.userProfileRoute, page: () => UserProfile()),
    ];
  }
}
