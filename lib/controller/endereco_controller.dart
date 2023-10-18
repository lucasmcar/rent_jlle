import 'dart:convert';
import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../models/endereco.dart';
part 'endereco_controller.g.dart';

class EnderecoController = EnderecoControllerBase with _$EnderecoController;

abstract class EnderecoControllerBase with Store {
  @observable
  bool loading = false;
  @action
  Future<Endereco> getEnderecoByCep(String cep) {
    throw Exception("Not Implemented yet");
  }

  Future<void> registerAddress(
      String url, Endereco endereco, Object idUsuario) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$url/api/endereco/"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "rua": endereco.rua,
          "cep": endereco.cep,
          "bairro": endereco.bairro,
          "localidade": endereco.localidade,
          "uf": endereco.uf,
          "idusuario": idUsuario
        }),
      );
    } on HttpException catch (ex) {
      throw Exception(ex.message.toString());
    }
  }
}
