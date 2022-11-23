import 'dart:convert';

import 'package:feirapp/models/enum/tipo_usuario_enum.dart';

class ProfileDTO {
  String nome;
  String email;
  String cpf;
  String telefone;
  String cep;
  TipoUsuarioEnum tipo;
  ProfileDTO({
    required this.nome,
    required this.email,
    required this.cpf,
    required this.telefone,
    required this.cep,
    required this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'telefone': telefone,
      'cep': cep,
      'tipo': tipo.index,
    };
  }

  factory ProfileDTO.fromMap(Map<String, dynamic> map) {
    int val = map['tipo'];
    return ProfileDTO(
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      cpf: map['cpf'] ?? '',
      telefone: map['telefone'] ?? '',
      cep: map['cep'] ?? '',
      tipo: TipoUsuarioEnum.values[val],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileDTO.fromJson(String source) =>
      ProfileDTO.fromMap(json.decode(source));
}
