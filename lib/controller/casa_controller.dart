import 'package:mobx/mobx.dart';

import '../models/casa.dart';
part 'casa_controller.g.dart';

class CasaController = CasaControllerBase with _$CasaController;

abstract class CasaControllerBase with Store {
  @observable
  bool loading = false;
  @action
  Future<Imovel> create(Imovel imovel) {
    throw Exception("Not Implemented yet");
  }

  @action
  Future<Imovel> getAll() {
    throw Exception("Not Implemented yet");
  }

  @action
  Future<Imovel> getAllSimple() {
    throw Exception("Not Implemented yet");
  }
}
