import 'package:getx_clean_architecture/features/authentication/data/models/account.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  HiveStorage._internal();

  static final HiveStorage _storage = HiveStorage._internal();

  factory HiveStorage() => _storage;

  // this box stores miscellaneous value
  static Box box = Hive.box("base");

  // init hive, register adapters
  Future<void> init() async {
    await Hive.initFlutter();

    // TODO: register adapters below here
    // e.x. await Hive.registerAdapter(ExampleAdapter());
    Hive.registerAdapter<AccountModel>(AccountModelAdapter());
    var openMiscBox = await Hive.openBox("base");
  }
}
