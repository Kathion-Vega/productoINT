import 'dart:async';
import 'dart:io';

import '../exceptions/app_exceptions.dart';
import 'base_service.dart';

class PeopleService extends BaseService {
  /// fetches people details
  Future<dynamic> getPeopleDetails({required int personId}) async {
    try {
      final response = await request(
          method: Requests.get,
          path: '/3/person/$personId',
          header: setHeaders(),
          queryParameter: setQueryParameters());
      // ignore: avoid_print
      // print(response.statusCode);
      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }

  /// fetches people Movie/tv credits , images , external ids
  Future<dynamic> getCreditsDetails(
      {required int personId, required String resultType}) async {
    try {
      final response = await request(
          method: Requests.get,
          path: '/3/person/$personId/$resultType',
          header: setHeaders(),
          queryParameter: setQueryParameters());
      // ignore: avoid_print
      // print(response.statusCode);
      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }
}
