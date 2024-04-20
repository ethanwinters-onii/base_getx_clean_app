import 'package:getx_clean_architecture/core/utils/local_storage/hive_storage.dart';
import 'package:getx_clean_architecture/core/utils/local_storage/local_db_constants.dart';
import 'package:getx_clean_architecture/features/authentication/data/models/account.dart';

class AuthenticationDAO {
  static Future<void> saveToken(String? token) {
    return HiveStorage.box.put(LocalDBConstants.TOKEN, token);
  }

  static String getToken() => HiveStorage.box.get(LocalDBConstants.TOKEN);

  static Future<void> saveAccount(AccountModel account) {
    return HiveStorage.box.put(LocalDBConstants.ACCOUNT_LOCAL, account);
  }

  static AccountModel? getAccount() => HiveStorage.box.get(LocalDBConstants.ACCOUNT_LOCAL);
}
