class CustomException {
  final String message;
  final String prefix;

  CustomException(this.message, this.prefix);

  @override
  String toString() {
    return "$prefix $message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException(String message)
      : super(message, "Error During Communication:");
}

class BadRequestException extends CustomException {
  BadRequestException(String message) : super(message, "Invalid Request:");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException(String message) : super(message, "Unauthorised:");
}

class InvalidInputException extends CustomException {
  InvalidInputException(String message) : super(message, "Invalid Input:");
}

class ForbiddenClienException extends CustomException {
  ForbiddenClienException(String message) : super(message, "Forbidden Client:");
}

class InternalServerErrorException extends CustomException {
  InternalServerErrorException(String message)
      : super(message, "Internal Server Error:");
}

class UnknownException extends CustomException {
  UnknownException(String message) : super(message, "Unknown Exception: ");
}
