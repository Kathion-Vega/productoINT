import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/configs.dart';
import '../../controllers/utility_controller.dart';
import 'components/watchlist_bottom_tabbar.dart';
import 'tabs/movie_watchlist.dart';
import 'tabs/tv_watchlist.dart';

class WatchlistPage extends StatelessWidget {
  WatchlistPage({Key? key}) : super(key: key);

  final _utilityController = Get.find<UtilityController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            alignment: Alignment.centerLeft,
            height: 62,
            child: const Text(
              'Tu whatalist',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: l,
                // color: primaryWhite,
                color: primaryDarkBlue,
              ),
            ),
          ),

          // tabbar
          watchlistTabbarComponent(tabMenuItems: tabItems),

          // tabs
          Obx(
            () => tabs[_utilityController.wacthlistTabbarCurrentIndex],
          ),
        ],
      ),
    );
    
  }
}

List<String> tabItems = [
  'Movies',
  'TV Series',
];

List<Widget> tabs = [
  MovieWatchlist(),
  TvWatchlist(),
];
