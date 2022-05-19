import 'dart:async';
import 'dart:io';

import '../exceptions/app_exceptions.dart';
import 'base_service.dart';

class ConfigurationService extends BaseService {
  Future<dynamic> getConfiguration() async {
    try {
      await request(
          method: Requests.get,
          path: "/3/configuration",
          header: setHeaders(),
          queryParameter: setQueryParameters());
      // ignore: avoid_print
      // print('CONFIGURATION STATUS => ${response.statusCode}');

      return decodeResponse(response);
    } on SocketException {
      throw FetchDataException('No hay Internet ');
    } on TimeoutException {
      throw ServiceNotRespondingException(
          'Revisa si estas conectado al Internet');
    }
  }
}
