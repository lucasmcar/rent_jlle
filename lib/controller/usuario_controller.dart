import 'package:imovel_direto/repositories/usuario_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../models/usuario.dart';
part 'usuario_controller.g.dart';

class UsuarioController = UsuarioControllerBase with _$UsuarioController;

abstract class UsuarioControllerBase with Store {
  final UsuarioRepository _userRepository = UsuarioRepository();

  UsuarioControllerBase() {
    autorun((isValidUser) {});
  }

  @observable
  bool loading = false;

  @observable
  bool isValidUser = false;

  @action
  Future<void> isValidUserName(String? username) async {
    loading = true;

    isValidUser = await _userRepository.isValidUser(username);

    loading = false;
  }

  @action
  Future<void> createUser(Usuario usuario) async {
    var response = await _userRepository.createUser(usuario);
    
  }
}
