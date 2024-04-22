import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/core/base/base_controller.dart';
import 'package:getx_clean_architecture/core/values/enums/status.dart';
import 'package:getx_clean_architecture/core/values/languages/localization_service.dart';
import 'package:getx_clean_architecture/features/authentication/data/models/account.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/get_token_model.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/sign_in_model.dart';
import 'package:getx_clean_architecture/features/authentication/domain/usecases/get_account_local.dart';
import 'package:getx_clean_architecture/features/authentication/domain/usecases/get_token.dart';
import 'package:getx_clean_architecture/features/authentication/domain/usecases/save_account.dart';
import 'package:getx_clean_architecture/features/authentication/domain/usecases/sign_in.dart';

class AuthenticationController extends BaseController {
  AuthenticationController(
    this.getTokenUseCase,
    this.signInUseCase,
    this.saveAccountUseCase,
    this.getAccountLocalUseCase,
  );

  final GetTokenUseCase getTokenUseCase;
  final SignInUseCase signInUseCase;
  final SaveAccountUseCase saveAccountUseCase;
  final GetAccountLocalUseCase getAccountLocalUseCase;

  AccountModel? account;
  final usernameEditingController = TextEditingController(text: "quyetnt");
  final passwordEditingController = TextEditingController(text: "123456");

  @override
  Future<void> initialData() async {
    // TODO: implement initialData
    final data = await getAccountLocalUseCase();
    account = data as AccountModel?;
    setStatus(Status.success);
    return super.initialData();
  }

  void changeLocale(String langCode) {
    LocalizationService.changeLocale(langCode);
  }

  void handleSignIn() async {
    setStatus(Status.waiting);
    final result = await getTokenUseCase(param: GetTokenRequest());
    processUsecaseResult<GetTokenResponse?>(
      result: result,
      onSuccess: (data) {
        if (data?.token != null) {
          _signIn();
        }
      },
    );
  }

  void _signIn() async {
    setStatus(Status.waiting);
    final result = await signInUseCase(
      param: SignInRequest(
        userName: usernameEditingController.text,
        passWord: passwordEditingController.text,
        socialNetwork: false,
        socialNetworkType: '',
        sociaNetworklUserId: '',
      ),
    );
    processUsecaseResult<SignInResponse?>(result: result);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
