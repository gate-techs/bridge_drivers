class ServerException implements Exception {}

class EmptyCashException implements Exception {}

class UnauthenticatedException implements Exception {
  UnauthenticatedException(this.message);

  final String message;
}

class UserNameException implements Exception {}

class BlockedException implements Exception {}
