import 'package:mobx/mobx.dart';

import '../models/imovel.dart';
part 'casa_controller.g.dart';

class CasaController = CasaControllerBase with _$CasaController;

abstract class CasaControllerBase with Store {
  @observable
  bool loading = false;
  @action
  Future<void> createRent(Imovel imovel) {

    throw Exception("Not Implemented yet");
  }

  @action
  Future<Imovel> getAll() {
    throw Exception("Not Implemented yet");
  }

  @action
  Future<Imovel> getAllSimpl() {
    throw Exception("Not Implemented yet");
  }

  @action
  Future<Imovel> getByRef(String? ref) {
    throw Exception("Not Implemented yet");
  }
}
