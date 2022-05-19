import 'dart:async';
import 'dart:io';

import '../exceptions/app_exceptions.dart';
import 'base_service.dart';

class AuthGuestService extends BaseService {
  // create guest session
  Future<dynamic> createGuestSession() async {
    try {
      await request(
        method: Requests.get,
        path: '/3/authentication/guest_session/new',
        queryParameter: setQueryParameters(),
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay Conección a Internet ');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa tu conección a Internet');
    }
  }
}
