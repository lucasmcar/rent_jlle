import 'package:mobx/mobx.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/feed_aluguel.dart';
part 'feed_aluguel_controller.g.dart';

class FeedAluguelController = FeedAluguelControllerBase
    with _$FeedAluguelController;

abstract class FeedAluguelControllerBase with Store {
  String? titulo;
  String? endereco;
  double? preco;

  @action
  Future<List<FeedAluguel>> _recuperarDado() async {
    //String idDigitado = _controllerId.text;
    String url = "http://10.0.0.103:4000";

    var response = await http.get(Uri.parse("$url/imoveis"));
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
