import 'package:imovel_direto/models/imovel.dart';
import 'package:imovel_direto/repositories/casa_repository.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/feed_aluguel.dart';
part 'feed_aluguel_controller.g.dart';

class FeedAluguelController = FeedAluguelControllerBase
    with _$FeedAluguelController;

abstract class FeedAluguelControllerBase with Store {
  CasaRepository casaRepository = CasaRepository();
  String? titulo;
  String? endereco;
  double? preco;

  @action
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

  @action
  Future<void> createRent(Imovel imovel) async {
    casaRepository.createRent(imovel);
  }
}
