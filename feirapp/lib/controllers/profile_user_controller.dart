import 'dart:convert';

import 'package:feirapp/data/repository/profile_user_repo.dart';
import 'package:feirapp/models/dtos/error_dto.dart';
import 'package:feirapp/models/dtos/profile_dto.dart';
import 'package:feirapp/models/profile_user_model.dart';
import 'package:get/get.dart';

class ProfileUserController extends GetxController {
  final ProfileUserRepo profileUserRepo;

  ProfileUserController({
    required this.profileUserRepo,
  });

  Future<ProfileUserModel> getInfoProfile(int id, String token) async {
    Response response = await profileUserRepo.getInfoProfileUser(id, token);
    if (response.statusCode == 200) {
      return ProfileUserModel.fromMap(response.body);
    } else {
      return throw Exception('Erro ao buscar dados do usuário.');
    }
  }

  Future<String> registerNewUser(ProfileUserModel profile) async {
    Response response = await profileUserRepo.registerNewUser(profile.toJson());
    if (response.statusCode == 200) {
      return 'Usuário cadastrado com sucesso!';
    } else {
      return 'Erro ao cadastrar usuário!';
    }
  }

  Future<String> updateProfile(ProfileUserModel profile, String token) async {
    //ajusta o body com as informaçõe que vao ser atualizadas
    ProfileDTO profileDTO = ProfileDTO(
      nome: profile.nome,
      email: '',
      cpf: '',
      telefone: profile.telefone,
      cep: profile.cep,
      tipo: profile.tipo,
    );

    Response response =
        await profileUserRepo.updateProfile(profileDTO.toJson(), token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return 'Informações atualizadas com sucesso!';
    } else {
      String msg = 'Não autorizado!';
      if (response.body != null) {
        ErrorDTO error = ErrorDTO.fromMap(response.body);
        msg = error.erro.isNotEmpty ? error.erro : error.erros[0].toString();
      }
      return 'Erro ao atualizar usuário. Erro: ' + msg;
    }
  }
}
