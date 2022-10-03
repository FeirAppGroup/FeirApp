import 'dart:convert';

class LoginDTO {
  String login;
  String senha;
  String? token;
  LoginDTO({
    required this.login,
    required this.senha,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return {'login': login, 'senha': senha};
  }

  factory LoginDTO.fromMap(Map<String, dynamic> map) {
    return LoginDTO(
      login: map['login'] ?? '',
      senha: map['senha'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDTO.fromJson(String source) =>
      LoginDTO.fromMap(json.decode(source));
}
