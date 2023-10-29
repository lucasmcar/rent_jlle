import 'dart:convert';
import 'dart:io';

import 'package:imovel_direto/repositories/casa_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../models/imovel.dart';
part 'casa_controller.g.dart';

class CasaController = CasaControllerBase with _$CasaController;

abstract class CasaControllerBase with Store {
  final CasaRepository _repositoryCasa = CasaRepository();
  @observable
  bool loading = false;

  ObservableList<Imovel> imoveis = ObservableList();

  @action
  Future<void> createRent(Imovel imovel) {
    throw Exception("Not Implemented yet");
  }

  @action
  Future<List<Imovel>> getAll() async {
    imoveis = ObservableList<Imovel>.of(await _repositoryCasa.getAll());
    return imoveis;
  }

  @action
  Future<Imovel> getAllSimpl() {
    throw Exception("Not Implemented yet");
  }

  @action
  Future<Imovel> getByRef(String? ref) async {
    String url = "http://192.168.100.123:4000";

    http.Response response;
    Imovel imovel;
    try {
      response = await http.get(Uri.parse("$url/api/imovel/$ref"));

      imovel = jsonDecode(response.body);

      return imovel;
      // ignore: empty_catches
    } on HttpException catch (ex) {}
    throw Exception("No data");
  }
}
