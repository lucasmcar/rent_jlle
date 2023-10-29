import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:imovel_direto/models/usuario.dart';

class UsuarioRepository {
  /// Método que busca um usuario na base de dados
  /// Retorna true, se o usuário for válido, ou seja, não existir na base
  /// e false, caso o usuário ja exista

  Future<bool> isValidUser(String? username) async {
    String url = "http://192.168.100.123:4000";

    http.Response response;
    bool isValidUser = false;
    try {
      if (username!.isEmpty || username == "") {
        isValidUser = false;
        return isValidUser;
      }

      response = await http.get(Uri.parse("$url/api/usuario/valida/$username"));

      if (response.request!.contentLength == 0) {
        isValidUser = true;
        return isValidUser;
      }

      var user = jsonDecode(response.body);

      for (var u in user) {
        if (u['username'] == username) {
          isValidUser = false;
        } else {
          isValidUser = true;
        }
      }

      return isValidUser;
      // ignore: empty_catches
    } on HttpException catch (ex) {}
    throw Exception("No data");
  }

  Future<void> createUser(Usuario usuario) async {
    String url = "http://192.168.100.123:4000";

    try {
      http.Response response;
      response = await http.post(Uri.parse("$url/api/usuario/novor"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "nome": usuario.nome,
            "username": usuario.nmUsuario,
            "email": usuario.email,
            "senha": usuario.senha,
            "idtipo_usuario" : usuario.tipoUsuario
          }));
    } on HttpException catch (ex) {
      throw Exception("Error: ${ex.message}");
    }
  }
}
