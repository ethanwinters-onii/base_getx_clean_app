import 'package:dio/dio.dart' hide Headers;
import 'package:getx_clean_architecture/core/network/endpoints.dart';
import 'package:getx_clean_architecture/core/network/network_constants.dart';
import 'package:getx_clean_architecture/core/utils/typedef/typedef.dart';
import 'package:getx_clean_architecture/features/authentication/data/models/account.dart';
import 'package:getx_clean_architecture/features/authentication/data/models/get_token.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/get_token_model.dart';
import 'package:getx_clean_architecture/features/authentication/domain/entities/sign_in_model.dart';
import 'package:retrofit/retrofit.dart';
part 'authentication_api_service.g.dart';

@RestApi(baseUrl: Endpoints.BASE_URL)
abstract class AuthenticationAPIService {
  factory AuthenticationAPIService(Dio dio) = _AuthenticationAPIService;

  @POST(Endpoints.GET_TOKEN)
  DioResult<GetTokenModel> getToken(@Body() GetTokenRequest rq);

  @POST(Endpoints.SIGN_IN)
  DioResult<AccountModel> signIn(
      @Header(NetworkHeaders.AUTHORIZATION) String token, @Body() SignInRequest rq);
}
