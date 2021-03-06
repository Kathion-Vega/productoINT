import 'dart:async';
import 'dart:io';

import '../exceptions/app_exceptions.dart';
import 'base_service.dart';

class AuthV3Service extends BaseService {
// create request token [1]
  Future<dynamic> createV3RequestToken() async {
    try {
      await request(
        method: Requests.get,
        path: '/3/authentication/token/new',
        header: setHeaders(),
        queryParameter: setQueryParameters(),
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay Conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa tu conección a Internet');
    }
  }

  // authorize request token with login [2]
  Future<dynamic> authorizeV3RequestTokenWithLogin({
    required String requestToken,
    required Map<String, dynamic> data,
  }) async {
    data["request_token"] = requestToken;

    try {
      await request(
        method: Requests.post,
        path: '/3/authentication/token/validate_with_login',
        header: setHeaders(),
        queryParameter: setQueryParameters(),
        body: data,
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa tu conección al Internet');
    }
  }

// create session - TMDb registered users [3]
  Future<dynamic> createV3Session({required String requestToken}) async {
    try {
      await request(
        method: Requests.post,
        path: '/3/authentication/session/new',
        header: setHeaders(),
        queryParameter: setQueryParameters(),
        body: {"request_token": requestToken},
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay Connección al Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa tu conección al internet');
    }
  }

// create guest user session
  Future<dynamic> createGuestSession() async {
    try {
      await request(
        method: Requests.get,
        path: '/3/authentication/guest_session/new',
        queryParameter: setQueryParameters(),
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay Internet');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si tienes Internet');
    }
  }

  // logout - delete session

  Future<dynamic> deleteSession({required String sessionId}) async {
    try {
      await request(
        method: Requests.delete,
        path: '/3/authentication/session',
        header: setHeaders(),
        queryParameter: setQueryParameters(),
        body: {"session_id": sessionId},
      );

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay Internet ');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }
}
