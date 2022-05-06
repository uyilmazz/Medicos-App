abstract class ILocalCacheManager {
  Future<void> firstInstallSave();
  bool getFirstInstall();
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}
