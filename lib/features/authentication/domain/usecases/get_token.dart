import 'package:getx_clean_architecture/core/base/usecase.dart';
import 'package:getx_clean_architecture/core/utils/typedef/typedef.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/get_token_model.dart';
import 'package:getx_clean_architecture/features/authentication/domain/repository/sign_in_repository.dart';

class GetTokenUseCase implements UseCase<GetTokenResponse?, GetTokenRequest> {
  final SignInRepository _repository;

  GetTokenUseCase(this._repository);

  @override
  ResultFuture<GetTokenResponse?> call({GetTokenRequest? param}) {
    return _repository.getToken(param!);
  }
}
