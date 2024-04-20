import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/core/network/network_checker_interceptor.dart';
import 'package:getx_clean_architecture/features/authentication/data/data_sources/remote/authentication_api_service.dart';
import 'package:getx_clean_architecture/features/authentication/data/repository/sign_in_repository_impl.dart';
import 'package:getx_clean_architecture/features/authentication/domain/repository/sign_in_repository.dart';
import 'package:getx_clean_architecture/features/authentication/domain/usecases/get_account_local.dart';
import 'package:getx_clean_architecture/features/authentication/domain/usecases/get_token.dart';
import 'package:getx_clean_architecture/features/authentication/domain/usecases/save_account.dart';
import 'package:getx_clean_architecture/features/authentication/domain/usecases/sign_in.dart';

class InjectionContainer {
  InjectionContainer._();

  static init() {
    _httpClient();
    _authentication();
  }

  static void _httpClient() {
    Dio dio = Dio();
    dio.interceptors.add(NetworkCheckerInterceptor());
    Get.lazyPut(() => dio, fenix: true);
  }

  static void _authentication() {
    Get
      // Data source
      ..lazyPut<AuthenticationAPIService>(
        () => AuthenticationAPIService(Get.find()),
        fenix: true,
      )

      // Repository
      ..lazyPut<SignInRepository>(
        () => SignInRepositoryImpl(Get.find()),
        fenix: true,
      )

      // Use case
      ..lazyPut<GetAccountLocalUseCase>(
        () => GetAccountLocalUseCase(Get.find()),
        fenix: true,
      )
      ..lazyPut<GetTokenUseCase>(
        () => GetTokenUseCase(Get.find()),
        fenix: true,
      )
      ..lazyPut<SaveAccountUseCase>(
        () => SaveAccountUseCase(Get.find()),
        fenix: true,
      )
      ..lazyPut<SignInUseCase>(
        () => SignInUseCase(Get.find()),
        fenix: true,
      );
  }
}
