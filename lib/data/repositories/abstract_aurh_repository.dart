abstract class AuthRepository {
  Future<String?> getName();

  Future<String?> getMail();

  Future<String?> getPassword();

  Future<bool> getAuth();

  Future<void> setData(String name, String mail, String password);

  Future<void> setIsAuthTrue();

  Future<void> setIsAuthFalse();
}
