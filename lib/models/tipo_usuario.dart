class TipoUsuario {
  int? idTipoUsuario;
  String? tipo;
  String? nomeTipo;

  TipoUsuario({this.idTipoUsuario, this.tipo, this.nomeTipo});

  factory TipoUsuario.fromJson(Map<String, dynamic> json) {
    return TipoUsuario(
        idTipoUsuario: json['idtipo_usuario'],
        tipo: json['tipo'],
        nomeTipo: json['nometipo']);
  }

  Map<String, dynamic> toJson() =>
      {'idtipo_usuario': idTipoUsuario, 'tipo': tipo, 'nometipo': nomeTipo};
}

