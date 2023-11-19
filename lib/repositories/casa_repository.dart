import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:imovel_direto/models/imovel.dart';
import 'package:imovel_direto/utils/uri_util.dart';

class CasaRepository {
  Future<List<Imovel>> getAll() async {
    UriUtil? uri;

    http.Response response;

    try {
      response = await http.get(uri!.getUri("api", "imoveis") as Uri);
      var dadosJson = jsonDecode(response.body);

      List<Imovel> imoveis = [];
      for (var imovel in dadosJson) {
        Imovel i = Imovel(
          idImovel: imovel['idimovel'],
          titulo: imovel["titulo"],
          tipoImovel: imovel["tipoimovel"],
          nrComodo: imovel["nrcomodos"],
          nrQuarto: imovel["nrquarto"],
          nrBanheiro: imovel["nrbanheiro"],
          espacoGaragem: imovel["espaco_garagem"],
          permitePet: imovel["idpermite_pet"],
          permiteCrianca: imovel["idpermite_crianca"],
          dtCadastro: imovel["dtcadastro"],
          idUsuario: imovel["idusuario"].toString(),
          descricao: imovel["descricao"],
          referencia: imovel["referencia"],
          preco: double.parse(imovel["preco"] ?? "0.0"),
        );

        imoveis.add(i);
      }
      if (response.statusCode == 200) {
        return imoveis;
      }
    } on HttpException {}
    throw Exception("Erro");
  }

  Future<void> createRent(Imovel imovel) async {
    UriUtil? uri;

    try {
      http.Response response = await http.post(uri!.getUri("api", "imovel/novo") as Uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "titulo": imovel.titulo,
          "tipoimovel": imovel.tipoImovel,
          "nrcomodos": imovel.nrComodo,
          "nrquarto": imovel.nrQuarto,
          "nrbanheiro": imovel.nrBanheiro,
          "dtcadastro": imovel.dtCadastro,
          "idpermite_pet": imovel.permitePet,
          "idpermite_crianca": imovel.permiteCrianca,
          "espaco_garagem": imovel.espacoGaragem,
          "preco": imovel.preco,
          "descricao": imovel.descricao,
          "referencia": imovel.referencia,
          "idusuario": imovel.idUsuario
        }),
      );
    } on HttpException catch (ex) {
      throw Exception(ex.message.toString());
    }
  }
}
