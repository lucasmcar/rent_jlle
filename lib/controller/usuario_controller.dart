import 'package:mobx/mobx.dart';

import '../models/usuario.dart';
part 'usuario_controller.g.dart';

class UsuarioController = UsuarioControllerBase with _$UsuarioController;

abstract class UsuarioControllerBase with Store {}
