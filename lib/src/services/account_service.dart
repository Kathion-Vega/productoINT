import 'dart:async';
import 'dart:io';

import '../exceptions/app_exceptions.dart';
import 'base_service.dart';

class AccountService extends BaseService {
  // get account details
  Future<dynamic> getAccountDetails() async {
    try {
      await request(
        method: Requests.get,
        path: '/3/account',
        queryParameter: setQueryParameters(),
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay Internet ');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }

  // add to watchlist - movies/tv
  Future<dynamic> postToWatchlist({
    required String mediaType,
    required int? mediaId,
    required bool watchlist,
  }) async {
    try {
      await request(
        method: Requests.post,
        path: '/3/account/{account_id}/watchlist',
        header: setHeaders(),
        queryParameter: setQueryParameters(),
        body: {
          "media_type": mediaType,
          "media_id": '$mediaId',
          "watchlist": watchlist
        },
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si tienes conección al Internet');
    }
  }

  // get watchlist - movies/tv
  Future<dynamic> getWatchList({required String mediaType}) async {
    try {
      await request(
        method: Requests.get,
        path: '/3/account/{account_id}/watchlist/$mediaType',
        queryParameter: setQueryParameters(),
      );

      return decodeResponse(response)['results'];
    } on SocketException {
      throw FetchDataException('No hay Internet ');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'No tienes internet, revisa si estas conectado');
    }
  }

  // Future<dynamic> getTvWatchList({required int accountId}) async {
  //   try {
  //     await request(
  //       method: Requests.get,
  //       path: '/3/account/$accountId/watchlist/tv',
  //       queryParameter: setQueryParameters(),
  //     );

  //     return decodeResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No hay conección al Internet');
  //   } on TimeoutException {
  //     throw ServiceNotRespondingException(
  //         'Revisa si estas conectado al Internet');
  //   }
  // }

  // add to favorite
  Future<dynamic> postToFavorite({
    required String mediaType,
    required int? mediaId,
    required bool favorite,
  }) async {
    try {
      await request(
        method: Requests.post,
        path: '/3/account/{account_id}/favorite',
        header: setHeaders(),
        queryParameter: setQueryParameters(),
        body: {
          "media_type": mediaType,
          "media_id": '$mediaId',
          "favorite": favorite
        },
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }

  // get favorite list movies/tv
  Future<dynamic> getFavortes({required String mediaType}) async {
    try {
      await request(
        method: Requests.get,
        path: '/3/account/{account_id}/favorite/$mediaType',
        queryParameter: setQueryParameters(),
      );

      return decodeResponse(response)['results'];
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }

  // Future<dynamic> getFavorteTv({required int accountId}) async {
  //   try {
  //     await request(
  //       method: Requests.get,
  //       path: '/3/account/$accountId/favorite/tv',
  //       queryParameter: setQueryParameters(),
  //     );

  //     return decodeResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No hay conección al Internet');
  //   } on TimeoutException {
  //     throw ServiceNotRespondingException(
  //         'Revisa si estas conectado al Internet');
  //   }
  // }

//
}
