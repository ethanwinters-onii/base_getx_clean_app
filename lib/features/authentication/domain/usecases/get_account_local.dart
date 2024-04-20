import 'package:getx_clean_architecture/core/base/usecase.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/sign_in_model.dart';
import 'package:getx_clean_architecture/features/authentication/domain/repository/sign_in_repository.dart';

class GetAccountLocalUseCase implements DAOUseCase<SignInResponse?, void> {
  final SignInRepository _repository;

  GetAccountLocalUseCase(this._repository);

  @override
  Future<SignInResponse?> call({void param}) {
    return _repository.getAccountLocal();
  }
}
