import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(super.state);

  AuthRepositorySharedPrefs authRepository = AuthRepositorySharedPrefs();

  Future<void> loadData() async{

    state = AuthState(
        isAuthenticated: await authRepository.getAuth(),
        name: await authRepository.getName(),
        mail: await authRepository.getMail(),
        password: await authRepository.getPassword());

  }


  signUp(String name, String mail, String password) {
    state = AuthState(
        isAuthenticated: true, name: name, mail: mail, password: password);
    authRepository.setData(name, mail, password);
  }

  bool signIn(String name, String password){
    if (state.name == name && state.password == password){
      state = state.copyWith(isAuthenticated: true);
      authRepository.setIsAuthTrue();
      return true;
    }
    return false;
  }

  exit(){
    state = state.copyWith(isAuthenticated: false);
    authRepository.setIsAuthFalse();
  }

}