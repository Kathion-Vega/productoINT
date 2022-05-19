class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() => '$_prefix$_message';
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error durante la Communicacion: ');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalido: ');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, 'No autorizado: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalido: ');
}

class ServiceNotRespondingException extends AppException {
  ServiceNotRespondingException([String? message])
      : super(message, 'No hay Respuesta: ');
}
