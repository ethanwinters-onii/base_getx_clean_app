import 'package:equatable/equatable.dart';

class GetTokenRequest {
  String? userName;
  String? password;
  Parameters? parameters;

  GetTokenRequest({
    this.userName,
    this.password,
    this.parameters,
  });

  factory GetTokenRequest.fromJson(Map<String, dynamic> json) =>
      GetTokenRequest(
        userName: json["userName"],
        password: json["password"],
        parameters: json["parameters"] == null
            ? null
            : Parameters.fromJson(json["parameters"]),
      );

  Map<String, dynamic> toJson() => {
        "userName": userName ?? "WebService",
        "password": password ?? "WebService",
        "parameters": parameters == null
            ? {
                "clientId": 1000000,
                "roleId": 1000040,
                "organizationId": 0,
                "warehouseId": 0,
                "language": "en_US"
              }
            : parameters?.toJson(),
      };
}

class Parameters {
  int? clientId;
  int? roleId;
  int? organizationId;
  int? warehouseId;
  String? language;

  Parameters({
    this.clientId,
    this.roleId,
    this.organizationId,
    this.warehouseId,
    this.language,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        clientId: json["clientId"],
        roleId: json["roleId"],
        organizationId: json["organizationId"],
        warehouseId: json["warehouseId"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "clientId": clientId,
        "roleId": roleId,
        "organizationId": organizationId,
        "warehouseId": warehouseId,
        "language": language,
      };
}

class GetTokenResponse extends Equatable {
  int? userId;
  String? language;
  String? token;

  GetTokenResponse({
    this.userId,
    this.language,
    this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [userId, language, token];
}
