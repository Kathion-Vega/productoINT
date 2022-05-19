import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../configs/configs.dart';
import '../../../../configs/strings.dart';
import '../../../../controllers/account_controller.dart';
import '../../../../controllers/base_controller.dart';
import '../../../../controllers/details_controller.dart';
import '../../../../global/loading_spinner.dart';
import '../../../../helpers/widget_builder_helper.dart';
import '../../../../utils/auth.dart';
import 'tv_rating_component.dart';

Widget tvFlexibleSpacebarOptions({required DetailsController controller}) {
  final _detailsController = Get.find<DetailsController>();
  final _accountController = Get.find<AccountController>();

  return GetBuilder(
    id: 'account_state',
    init: _detailsController,
    initState: (_) {
      Auth().isGuestLoggedIn == true
          ? null
          : _detailsController.getOtherDetails(
              resultType: tvString,
              id: '${_detailsController.tvDetail.value.id}',
              appendTo: accountStateString,
            );
    },
    builder: (controller) => WidgetBuilderHelper(
        state: _detailsController.accountstateState.value,
        onLoadingBuilder: LoadingSpinner().horizontalLoading,
        onSuccessBuilder:
            _detailsController.accountstateState.value == ViewState.busy
                ? LoadingSpinner().horizontalLoading
                : Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        mainAxisAlignment: Auth().isGuestLoggedIn == true
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.spaceAround,
                        children: [
                          // user score circle percent indicator
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
                            child: Row(
                              children: [
                                _detailsController.tvDetail.value.voteAverage ==
                                        null
                                    ? const SizedBox.shrink()
                                    : CircularPercentIndicator(
                                        radius: 56,
                                        percent: (_detailsController
                                                .tvDetail.value.voteAverage! /
                                            10),
                                        curve: Curves.ease,
                                        animation: true,
                                        animationDuration: 800,
                                        progressColor: primaryblue,
                                        center: Text(
                                          '${(_detailsController.tvDetail.value.voteAverage! * 10).toInt()}%',
                                          style: const TextStyle(
                                            color: primaryDarkBlue,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                const SizedBox(width: 4),
                                const Text(
                                  'User\nScore',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: n - 2,
                                    fontWeight: FontWeight.w700,
                                    color: primaryDarkBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // watchlist btn
                          Auth().isGuestLoggedIn == true
                              ? const SizedBox.shrink()
                              : _accountController.watchlistState.value ==
                                      ViewState.busy
                                  ? LoadingSpinner().fadingCircleSpinner
                                  : optionBtn(
                                      onTap: () {
                                        print(_detailsController
                                            .accountState.value.watchlist);

                                        if (_detailsController
                                                .accountState.value.watchlist ==
                                            false) {
                                          _accountController.postToWatchlist(
                                            mediaId: _detailsController
                                                .tvDetail.value.id,
                                            mediaType: tvString,
                                            watchlist: true,
                                          );
                                        } else {
                                          _accountController.postToWatchlist(
                                            mediaId: _detailsController
                                                .tvDetail.value.id,
                                            mediaType: tvString,
                                            watchlist: false,
                                          );
                                        }
                                      },
                                      color: _detailsController.accountState
                                                  .value.watchlist ==
                                              true
                                          ? primaryblue
                                          : primaryWhite,
                                      icon: Icons.favorite,
                                    ),
                        ],
                      ),
                    ),
                  ),
        onErrorBuilder: const Center(
          child: Text('error cargando data ...'),
        )),
  );
}

// helpers
Widget optionBtn({IconData? icon, void Function()? onTap, Color? color}) {
  return GestureDetector(
    onTap: onTap ?? () {},
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: primaryDarkBlue.withOpacity(0.9),
            shape: BoxShape.circle,
          ),
        ),
        Icon(
          icon ?? Icons.list,
          size: 20,
          color: color ?? primaryWhite,
        ),
      ],
    ),
  );
}
