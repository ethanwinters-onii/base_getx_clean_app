import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:getx_clean_architecture/core/errors/failures.dart';
import 'package:getx_clean_architecture/core/network/network_connection_checker.dart';
import 'package:getx_clean_architecture/core/utils/extensions/logger_extension.dart';
import 'package:getx_clean_architecture/generated/locales.g.dart';

class NetworkCheckerInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!(await NetworkChecker.isConnected)) {
      return NoInternetConnection(
        statusCode: -1,
        message: LocaleKeys.network_error_no_network_connection.tr,
      );
    }
    logger.i('Path: ${options.baseUrl}${options.path}');
    logger.i('Body request:');
    logger.i(options.data);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data
    logger.d('Status Code: ${response.statusCode}');
    logger.d('Response');
    logger.d(response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    logger.e(err.message);
    super.onError(err, handler);
  }
}
