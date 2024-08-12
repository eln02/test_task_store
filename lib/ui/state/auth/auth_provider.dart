import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_controller.dart';
import 'auth_state.dart';




final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(
      AuthState(isAuthenticated: false, name: null, mail: null, password: null));
});
