import 'package:getx_clean_architecture/core/utils/typedef/typedef.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/get_token_model.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/sign_in_model.dart';

abstract class SignInRepository {
  // API Method
  ResultFuture<GetTokenResponse?> getToken(GetTokenRequest rq);
  ResultFuture<SignInResponse?> signIn(SignInRequest rq);

  // DAO
  Future<SignInResponse?> getAccountLocal();
  Future<void> saveAccount(SignInResponse account);
}
