import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imovel_direto/models/feed_aluguel.dart';

class FeedAluguelRepoistory {
  Future<List<FeedAluguel>> recuperarDadosCasa() async {
    //String idDigitado = _controllerId.text;
    String url = "http://192.168.100.123:4000";

    var response = await http.get(Uri.parse("$url/api/imoveis"));
    var dadosJson = jsonDecode(response.body);

    List<FeedAluguel> alugueis = [];
    for (var aluguel in dadosJson) {
      FeedAluguel a = FeedAluguel(
          titulo: aluguel["titulo"],
          endereco: aluguel["endereco"],
          preco: aluguel["preco"]);
      alugueis.add(a);
    }
    return alugueis;
  }
}
