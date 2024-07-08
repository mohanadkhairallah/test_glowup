class LoginParams {
  String? username;
  String? password;

  LoginParams({this.username, this.password});

  Map<String, dynamic> toJson() => {
        "phone": username,
        "password": password,
      };
}
