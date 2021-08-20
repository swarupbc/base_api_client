class ApiExceptions implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  ApiExceptions([this.message, this.prefix, this.url]);
}

class BadRequestException extends ApiExceptions {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url);
}

class FetchDataException extends ApiExceptions {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends ApiExceptions {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responding', url);
}

class UnauthorizedException extends ApiExceptions {
  UnauthorizedException([String? message, String? url])
      : super(message, 'Unauthorized Request', url);
}

class NotFoundException extends ApiExceptions {
  NotFoundException([String? message, String? url])
      : super(message, '404 Not found', url);
}
