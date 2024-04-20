abstract class Failure {
  final int statusCode;
  final String message;

  const Failure({required this.statusCode, required this.message});

  @override
  List<Object?> get props => [statusCode, message];
}

class SystemFailure extends Failure {
  const SystemFailure({required int statusCode, required String message})
      : super(statusCode: statusCode, message: message);
}
class AuthFailure extends Failure {
  const AuthFailure({required int statusCode, required String message})
      : super(statusCode: statusCode, message: message);
}

class ServerFailureWithMessage extends Failure {
  const ServerFailureWithMessage({required int statusCode, required String message})
      : super(statusCode: statusCode, message: message);
}

class NoInternetConnection extends Failure {
  const NoInternetConnection({required int statusCode, required String message})
      : super(statusCode: statusCode, message: message);
}
