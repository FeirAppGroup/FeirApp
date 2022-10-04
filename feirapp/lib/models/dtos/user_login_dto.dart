import 'dart:convert';

class UserLoginDto {
  String email;
  String nome;
  String token;
  UserLoginDto({
    required this.email,
    required this.nome,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nome': nome,
      'token': token,
    };
  }

  factory UserLoginDto.fromMap(Map<String, dynamic> map) {
    return UserLoginDto(
      email: map['email'] ?? '',
      nome: map['nome'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginDto.fromJson(String source) =>
      UserLoginDto.fromMap(json.decode(source));
}
