class ServerException implements Exception  {}

class CacheException implements Exception {}

class FetchNetworkException {
  final String message;

  FetchNetworkException(this.message);
}

class BadRequestException {
  final String message;

  BadRequestException(this.message);
}

class UnauthorisedException {
  final String message;

  UnauthorisedException(this.message);
}

class InvalidInputException {
  final String message;

  InvalidInputException(this.message);
}

class InternalServerException {
  final String message;

  InternalServerException(this.message);
}

class NoServiceFoundException {
  final String message;

  NoServiceFoundException(this.message);
}

class InvalidFormatException {
  final String message;

  InvalidFormatException(this.message);
}
