import 'package:medicos_app/core/init/cache/ILocal_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalCacheManager extends ILocalCacheManager {
  static LocalCacheManager? _instance;
  static LocalCacheManager get instance =>
      _instance ??= LocalCacheManager._init();

  late final SharedPreferences _sharedPreferences;
  late final FlutterSecureStorage _secureStorage;

  LocalCacheManager._init() {
    _secureStorage = const FlutterSecureStorage();
  }

  Future<void> sharedPreferencesInit() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> firstInstallSave() async {
    await _sharedPreferences.setBool('firstInstall', false);
  }

  @override
  bool getFirstInstall() {
    return _sharedPreferences.getBool('firstInstall') ?? true;
  }

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'token', value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
  }

  @override
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: 'token');
  }
}
