import 'package:shared_preferences/shared_preferences.dart';

import 'abstract_aurh_repository.dart';

class AuthRepositorySharedPrefs implements AuthRepository {
  static const _nameKey = 'name';
  static const _mailKey = 'mail';
  static const _authKey = 'auth';
  static const _passwordKey = 'password';

  @override
  Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_nameKey);
  }

  @override
  Future<String?> getMail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_mailKey);
  }

  @override
  Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_passwordKey);
  }

  @override
  Future<bool> getAuth() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_authKey) ?? false;
  }

  @override
  Future<void> setData(String name, String mail, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_nameKey, name);
    prefs.setString(_mailKey, mail);
    prefs.setString(_passwordKey, password);
    prefs.setBool(_authKey, true);
  }

  @override
  Future<void> setIsAuthTrue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_authKey, true);
  }

  @override
  Future<void> setIsAuthFalse() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_authKey, false);
  }
}
