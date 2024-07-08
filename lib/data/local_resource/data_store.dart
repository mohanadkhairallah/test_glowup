import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'datastore_keys.dart';

class DataStore {
  DataStore._internal();

  static final DataStore _instance = DataStore._internal();

  static DataStore get instance => _instance;

  late Box<dynamic> box;

  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(DataStoreKeys.box);
    log("Datastore initialized", name: "$runtimeType");
  }

  /// Name
  Future<void> setName(String name) => box.put(DataStoreKeys.name, name);

  String? get name {
    if (!box.containsKey(DataStoreKeys.name)) return null;
    return box.get(DataStoreKeys.name);
  }

  void deleteUserInfo() => box.deleteAll({DataStoreKeys.name});

  /// Token
  bool get hasToken => box.containsKey(DataStoreKeys.token);

  String? get token {
    if (!box.containsKey(DataStoreKeys.token)) return null;
    return "${box.get(DataStoreKeys.token)}";
  }

  Future<void> setToken(String value) => box.put(DataStoreKeys.token, value);

  void deleteToken() => box.deleteAll({DataStoreKeys.token});
}
