import 'dart:convert';
import 'package:feirapp/models/enum/tipo_usuario_enum.dart';

class ProfileUserModel {
  int id;
  String nome;
  String telefone;
  String email;
  String cep;
  String senha;
  String cpf;
  String cnpj;
  String dap;
  TipoUsuarioEnum tipoUsuario;
  ProfileUserModel({
    required this.id,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.cep,
    required this.senha,
    required this.cpf,
    required this.cnpj,
    required this.dap,
    required this.tipoUsuario,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone	': telefone,
      'email': email,
      'cep': cep,
      'senha': senha,
      'cpf': cpf,
      'cnpj': cnpj,
      'dap': dap,
      'tipoUsuario': tipoUsuario.index,
    };
  }

  factory ProfileUserModel.fromMap(Map<String, dynamic> map) {
    int val = map['tipoUsuario'];
    return ProfileUserModel(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      telefone: map['telefone	'] ?? '',
      email: map['email'] ?? '',
      cep: map['cep'] ?? '',
      senha: map['senha'] ?? '',
      cpf: map['cpf'] ?? '',
      cnpj: map['cnpj'] ?? '',
      dap: map['dap'] ?? '',
      tipoUsuario: TipoUsuarioEnum.values[val],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileUserModel.fromJson(String source) =>
      ProfileUserModel.fromMap(json.decode(source));
}
