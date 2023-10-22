import 'package:imovel_direto/models/agenda_visita.dart';

class StatusAgenda
{

  int? idStatusAgenda;
  String? status;
  AgendaVisita? agendaVisita;


  StatusAgenda({
    required this.status,
    this.idStatusAgenda,
    this.agendaVisita,
  });

  factory StatusAgenda.fromJson(Map<String, dynamic> json){
    return StatusAgenda(
        idStatusAgenda: json['idstatus_agenda'],
        status: json['status'],
        agendaVisita: json['idagenda_vista']
    );
  }

  Map<String, dynamic> toJson() =>{
    "idstatus_agenda" : idStatusAgenda,
    "status" : status,
    "idagenda_vista" : agendaVisita!.idAgendaVisita
  };
}