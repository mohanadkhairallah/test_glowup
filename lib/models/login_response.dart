class LoginResponse {
  String name;
  String lastName;
  String token;

  LoginResponse({
    required this.name,
    required this.lastName,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        name: json["name"],
        lastName: json["lastName"],
      );
}
