import 'package:intl/intl.dart';

class Usuario {
  int? idUsuario;
  String? nome;
  String? nmUsuario;
  String? email;
  String? contato;
  bool? isWhats;
  String? senha;
  String? tipoUsuario;
  String? dtCadastro;

  Usuario(
      {this.idUsuario,
      this.nome,
      required this.nmUsuario,
      required this.email,
      required this.contato,
      this.isWhats,
      required this.senha,
      required this.tipoUsuario,
      this.dtCadastro});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['idusuario'],
      nome: json['nome'],
      nmUsuario: json['nmusuario'],
      email: json['email'],
      contato: json['contato'],
      isWhats: json['whatsapp'],
      senha: json['senha'],
      tipoUsuario: json['tipo_usuario'],
      dtCadastro: json['dtcadastro'],
    );
  }

  Map<String, dynamic> toJson() => {
        'idusuario': idUsuario,
        'nome': nome,
        'nmusuario': nmUsuario,
        'email': email,
        'contato': contato,
        'whatsapp': isWhats,
        'senha': senha,
        'tipo_usuario': tipoUsuario,
        'dtcadastro': DateFormat('yyyy-MM-dd').format(DateTime.now())
      };
}
