import 'package:intl/intl.dart';

class AgendaVisita
{
  int? idAgendaVisita;
  DateTime? dtAgenda;
  DateTime? hrAgenda;
  String? idUsuario;

  AgendaVisita({
    this.idUsuario,
    required this.dtAgenda,
    required this.hrAgenda,
    this.idAgendaVisita
  });

  factory AgendaVisita.fromJson(Map<String, dynamic> json){
    return AgendaVisita(
        idAgendaVisita: json['idagenda_visita'],
        dtAgenda: json['dtagenda'],
        hrAgenda: json['hragenda'],
        idUsuario: json['idusuario']
    );
  }

  Map<String, dynamic> toJson() => {
    "idagenda_visita" : idAgendaVisita,
    "dtagenda" : DateFormat("yyyy-MM-dd").format(dtAgenda!),
    "hragenda" : DateFormat("HH:mm").format(hrAgenda!),
    "idusuario" : idUsuario
  };
}