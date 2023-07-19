abstract class Failure {
  final String message;
  final StackTrace stackTrace;
  const Failure(
    this.message,
    this.stackTrace,
  );
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Bad request',
          stackTrace,
        );
}

class InternalServerErrorFailure extends Failure {
  const InternalServerErrorFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ??
              'Internal Server Error,stackTrace,, please try again later.',
          stackTrace,
        );
}

class ConflictFailure extends Failure {
  const ConflictFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Conflict occurred',
          stackTrace,
        );
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Access denied',
          stackTrace,
        );
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'The requested information,stackTrace, could not be found',
          stackTrace,
        );
}

class ConnectionTimeoutFailure extends Failure {
  ConnectionTimeoutFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Connection Timeout',
          stackTrace,
        );
}

class SendTimeoutFailure extends Failure {
  SendTimeoutFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Send Timeout',
          stackTrace,
        );
}

class ReceiveTimeoutFailure extends Failure {
  ReceiveTimeoutFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Receive Timeout',
          stackTrace,
        );
}

class BadCertificateFailure extends Failure {
  BadCertificateFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Bad Certificate',
          stackTrace,
        );
}

class BadResponseFailure extends Failure {
  BadResponseFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Bad Response',
          stackTrace,
        );
}

class CancelFailure extends Failure {
  CancelFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Cancel Failure',
          stackTrace,
        );
}

class ConnectionErrorFailure extends Failure {
  ConnectionErrorFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Connection Error',
          stackTrace,
        );
}

class UnknownFailure extends Failure {
  UnknownFailure({
    String? message,
    required StackTrace stackTrace,
  }) : super(
          message ?? 'Unknown Failure',
          stackTrace,
        );
}
