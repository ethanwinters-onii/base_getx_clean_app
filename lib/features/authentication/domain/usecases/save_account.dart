import 'package:getx_clean_architecture/core/base/usecase.dart';
import 'package:getx_clean_architecture/features/authentication/domain/repository/sign_in_repository.dart';

import '../entities/sign_in_model.dart';

class SaveAccountUseCase implements DAOUseCase<void, SignInResponse> {
  final SignInRepository _repository;

  SaveAccountUseCase(this._repository);

  @override
  Future<void> call({SignInResponse? param}) {
    return _repository.saveAccount(param!);
  }
}


