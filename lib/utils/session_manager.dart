import 'package:get_storage/get_storage.dart';

const kSavedLocation = "saved_location";

class SessionManager {
  static GetStorage _storages = GetStorage();

  static Future init() async => _storages = GetStorage();

  static setValue(String key, dynamic value) {
    _storages.write(key, value);
  }

  static dynamic getValue(String key, {dynamic value}) {
    return _storages.read(key) ?? value;
  }

  static dynamic removeValue(String key) {
    return _storages.remove(key);
  }

}
