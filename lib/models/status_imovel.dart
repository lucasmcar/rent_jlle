import 'package:imovel_direto/models/imovel.dart';
import 'package:intl/intl.dart';

import 'Usuario.dart';

class StatusImovel {
  int? idStatusImovel;
  String? status;
  DateTime? dtMinContrato;
  Imovel? imovel;
  Usuario? usuario;

  StatusImovel(
      {required this.status,
      required this.dtMinContrato,
      this.imovel,
      this.usuario});

  factory StatusImovel.fromJson(Map<String, dynamic> json) {
    return StatusImovel(
        status: json['status'],
        dtMinContrato: json['dtmincontrato'],
        imovel: json['idimovel'],
        usuario: json['idusuario']);
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "dtmin_contrato": DateFormat("yyyy-MM-dd").format(dtMinContrato!),
        "idimovel": imovel!.idImovel,
        "idusuario": usuario!.idUsuario
      };
}

