import 'package:getx_clean_architecture/features/authentication/domain/entities/get_token_model.dart';

class GetTokenModel extends GetTokenResponse {
  GetTokenModel({
    required super.userId,
    required super.language,
    required super.token,
  });

  factory GetTokenModel.fromJson(Map<String, dynamic> json) => GetTokenModel(
        userId: json["userId"],
        language: json["language"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "language": language,
        "token": token,
      };
}
