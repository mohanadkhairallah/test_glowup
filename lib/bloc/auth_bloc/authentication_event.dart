abstract class AuthenticationEvent {
  AuthenticationEvent([List props = const []]) : super();
}

class Login extends AuthenticationEvent {
  final String username;
  final String password;
  Login({required this.password, required this.username}) : super();
}
