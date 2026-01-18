abstract class Failure {
  final String message;
  final dynamic originalError;
  final StackTrace? stackTrace;

  const Failure(
    this.message, {
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() => message;

  String get userMessage => message;
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(
    super.message, {
    this.statusCode,
    super.originalError,
    super.stackTrace,
  });

  @override
  String get userMessage {
    if (statusCode == null) return message;
    switch (statusCode) {
      case 404:
        return 'Resource not found';
      case 401:
        return 'Authentication required';
      case 403:
        return 'Access forbidden';
      case 500:
      case 502:
      case 503:
        return 'Server error. Please try again later';
      default:
        return 'Server error ($statusCode)';
    }
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure(
    super.message, {
    super.originalError,
    super.stackTrace,
  });

  @override
  String get userMessage {
    if (message.contains('SocketException') || message.contains('Failed host lookup')) {
      return 'No internet connection. Please check your network';
    }
    if (message.contains('TimeoutException')) {
      return 'Request timed out. Please try again';
    }
    return 'Network error. Please check your connection';
  }
}

class InvalidDataFailure extends Failure {
  const InvalidDataFailure(
    super.message, {
    super.originalError,
    super.stackTrace,
  });

  @override
  String get userMessage => 'Invalid data format received';
}

class ParsingFailure extends Failure {
  const ParsingFailure(
    super.message, {
    super.originalError,
    super.stackTrace,
  });

  @override
  String get userMessage => 'Failed to parse response data';
}

class UnknownFailure extends Failure {
  const UnknownFailure(
    super.message, {
    super.originalError,
    super.stackTrace,
  });

  @override
  String get userMessage => 'An unexpected error occurred';
}
