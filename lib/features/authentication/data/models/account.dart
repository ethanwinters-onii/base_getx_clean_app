import 'package:getx_clean_architecture/features/authentication/domain/entities/sign_in_model.dart';
import 'package:hive/hive.dart';
part 'account.g.dart';

@HiveType(typeId: 0)
class AccountModel extends SignInResponse {
  @HiveField(7)
  String? username;

  @HiveField(8)
  String? password;

  AccountModel(
      {required super.adUserId,
      required super.email,
      required super.birthday,
      required super.firstLogin,
      required super.fullName,
      required super.phone,
      required super.userPin,
      this.username,
      this.password});

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        email: json["Email"],
        adUserId: json["AD_User_ID"],
        phone: json["Phone"],
        fullName: json["FullName"],
        userPin: json["UserPIN"],
        birthday: json["Birthday"],
        firstLogin: json["FirstLogin"] ?? true,
      );

  factory AccountModel.fromEntity(SignInResponse account) => AccountModel(
        adUserId: account.adUserId,
        email: account.email,
        birthday: account.birthday,
        firstLogin: account.firstLogin,
        fullName: account.fullName,
        phone: account.phone,
        userPin: account.userPin,
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "AD_User_ID": adUserId,
        "Phone": phone,
        "FullName": fullName,
        "UserPIN": userPin,
        "Birthday": birthday,
        "FirstLogin": firstLogin,
      };
}
