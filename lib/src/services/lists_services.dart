import 'dart:async';
import 'dart:io';

import '../exceptions/app_exceptions.dart';
import 'base_service.dart';

class ListService extends BaseService {
  /// create list [createList] method creates a new list of collection in a session
  Future<dynamic> createList(
      {required String name, required String description}) async {
    try {
      await request(
        method: Requests.post,
        path: '/3/list',
        header: setHeaders(),
        queryParameter: setQueryParameters(),
        body: {
          "name": name,
          "description": description,
          "language": "en",
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

  // get created lists
  Future<dynamic> getLists() async {
    try {
      await request(
        method: Requests.get,
        path: '/3/account/{account_id}/lists',
        queryParameter: setQueryParameters(),
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }

  //  get list details
  Future<dynamic> getListDetails({required int listId}) async {
    try {
      await request(
        method: Requests.get,
        path: '/3/list/$listId',
        queryParameter: setQueryParameters(),
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }

  // add movie to list
  Future<dynamic> addMovieToList(
      {required int? listId, required int? movieId}) async {
    try {
      await request(
        method: Requests.post,
        path: '/3/list/$listId/add_item',
        header: setHeaders(),
        queryParameter: setQueryParameters(),
        body: {"media_id": movieId},
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }

  // remove movie from list
  Future<dynamic> removeMovieFromList(
      {required int listId, required int movieId}) async {
    try {
      await request(
        method: Requests.post,
        path: '/3/list/$listId/remove_item',
        header: setHeaders(),
        queryParameter: setQueryParameters(),
        body: {"media_id": movieId},
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }

  // clear list - empty
  Future<dynamic> clearList({required int? listId}) async {
    try {
      await request(
        method: Requests.post,
        path: '/3/list/$listId/clear',
        header: setHeaders(),
        queryParameter: setQueryParameters(query: {"confirm": "true"}),
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }

  // delete list - empty
  Future<dynamic> deleteList({required int? listId}) async {
    try {
      await request(
        method: Requests.delete,
        path: '/3/list/$listId',
        queryParameter: setQueryParameters(),
        header: setHeaders(),
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }

//
}
