import 'package:getx_clean_architecture/core/base/usecase.dart';
import 'package:getx_clean_architecture/core/utils/typedef/typedef.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/sign_in_model.dart';
import 'package:getx_clean_architecture/features/authentication/domain/repository/sign_in_repository.dart';

class SignInUseCase implements UseCase<SignInResponse?, SignInRequest> {
  final SignInRepository _repository;

  SignInUseCase(this._repository);

  @override
  ResultFuture<SignInResponse?> call({SignInRequest? param}) {
    // TODO: implement call
    return _repository.signIn(param!);
  }
}
