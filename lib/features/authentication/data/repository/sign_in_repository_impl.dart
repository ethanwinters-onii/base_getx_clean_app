import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:getx_clean_architecture/core/errors/failures.dart';
import 'package:getx_clean_architecture/core/utils/extensions/logger_extension.dart';
import 'package:getx_clean_architecture/core/utils/typedef/typedef.dart';
import 'package:getx_clean_architecture/features/authentication/data/data_sources/DAO/authentication_dao.dart';
import 'package:getx_clean_architecture/features/authentication/data/data_sources/remote/authentication_api_service.dart';
import 'package:getx_clean_architecture/features/authentication/data/models/account.dart';
import 'package:getx_clean_architecture/features/authentication/data/models/get_token.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/get_token_model.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/sign_in_model.dart';
import 'package:getx_clean_architecture/features/authentication/domain/repository/sign_in_repository.dart';

class SignInRepositoryImpl extends SignInRepository {
  final AuthenticationAPIService _remoteDataSource;

  SignInRepositoryImpl(this._remoteDataSource);

  @override
  Future<AccountModel?> getAccountLocal() async {
    return AuthenticationDAO.getAccount();
  }

  @override
  ResultFuture<GetTokenModel?> getToken(GetTokenRequest rq) async {
    try {
      final httpResponse = await _remoteDataSource.getToken(rq);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        await AuthenticationDAO.saveToken(httpResponse.data.token);
        return Right(httpResponse.data);
      } else {
        return Left(AuthFailure(
          statusCode: httpResponse.response.statusCode ?? -1,
          message: httpResponse.response.statusMessage.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(SystemFailure(
        statusCode: -1,
        message: e.message ?? '',
      ));
    }
  }

  @override
  Future<void> saveAccount(SignInResponse account) {
    return AuthenticationDAO.saveAccount(AccountModel.fromEntity(account));
  }

  @override
  ResultFuture<AccountModel?> signIn(SignInRequest rq) async {
    try {
      final token = AuthenticationDAO.getToken();
      final httpResponse = await _remoteDataSource.signIn('Bearer: $token', rq);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      } else {
        return Left(AuthFailure(
          statusCode: httpResponse.response.statusCode ?? -1,
          message: httpResponse.response.statusMessage.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(SystemFailure(
        statusCode: -1,
        message: e.message ?? '',
      ));
    }
  }
}
