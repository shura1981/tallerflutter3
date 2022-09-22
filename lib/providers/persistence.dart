import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/settings.dart';

class Persitence {
  FlutterSecureStorage? _storage;

  static final Persitence _instance = Persitence._internal();

  factory Persitence() {
    return _instance;
  }

  Persitence._internal() {
    _storage = const FlutterSecureStorage();
  }

  Future<Settings> getSetting() async {
    final storage = await _storage!.read(key: "setting");
    return SettingsFromJson(storage!);
  }

  Future<void> setSetting(String user) async {
    await _storage!.write(key: "setting", value: user);
  }

  Future<void> deleteSetting() async {
    await _storage!.delete(key: "setting");
  }

  Future<void> deleteData() async {
    await _storage!.deleteAll();
  }
}
