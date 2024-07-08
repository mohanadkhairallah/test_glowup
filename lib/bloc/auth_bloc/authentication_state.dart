abstract class AuthState {}

class Init extends AuthState {}

class Success extends AuthState {}

class Error extends AuthState {
  String? error;
  Error(this.error);
}

class Loading extends AuthState {}
