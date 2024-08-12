class AuthState {
  bool isAuthenticated;
  String? name;
  String? mail;
  String? password;

  AuthState(
      {required this.isAuthenticated,
        required this.name,
        required this.mail,
        required this.password});

  AuthState copyWith({
    bool? isAuthenticated,
    String? name,
    String? mail,
    String? password,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      name: name ?? this.name,
      mail: mail ?? this.mail,
      password: password ?? this.password,
    );
  }
}
