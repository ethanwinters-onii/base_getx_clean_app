import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class SignInRequest extends Equatable {
  final String userName;
  final String passWord;
  final bool socialNetwork;
  final String socialNetworkType;
  final String sociaNetworklUserId;

  const SignInRequest({
    required this.userName,
    required this.passWord,
    required this.socialNetwork,
    required this.socialNetworkType,
    required this.sociaNetworklUserId,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
        userName: json["userName"],
        passWord: json["passWord"],
        socialNetwork: json["socialNetwork"],
        socialNetworkType: json["socialNetworkType"],
        sociaNetworklUserId: json["sociaNetworklUserId"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "passWord": passWord,
        "socialNetwork": socialNetwork,
        "socialNetworkType": socialNetworkType,
        "sociaNetworklUserId": sociaNetworklUserId,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        userName,
        passWord,
        socialNetwork,
        socialNetworkType,
        sociaNetworklUserId,
      ];
}

class SignInResponse extends Equatable {
  @HiveField(0)
  String? email;

  @HiveField(1)
  int? adUserId;

  @HiveField(2)
  String? phone;

  @HiveField(3)
  String? fullName;

  @HiveField(4)
  String? userPin;

  @HiveField(5)
  String? birthday;

  @HiveField(6)
  bool? firstLogin;

  SignInResponse({
    this.email,
    this.adUserId,
    this.phone,
    this.fullName,
    this.userPin,
    this.birthday,
    this.firstLogin,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [adUserId];
}
