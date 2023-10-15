import 'package:intl/intl.dart';

class Imovel {
  int? idImovel;
  String? titulo;
  String? tipoImovel;
  String? nrComodo;
  String? nrQuarto;
  String? nrBanheiro;
  String? espacoGaragem;
  String? dtCadastro;
  String? permitePet;
  String? permiteCrianca;
  String? idUsuario;
  double? preco;
  String? descricao;
  String? referencia;

  Imovel({
    this.idImovel,
    required this.titulo,
    required this.tipoImovel,
    required this.nrComodo,
    required this.nrQuarto,
    required this.nrBanheiro,
    required this.espacoGaragem,
    required this.dtCadastro,
    required this.permitePet,
    required this.permiteCrianca,
    this.preco,
    this.descricao,
    this.referencia,
    this.idUsuario,
  });

  factory Imovel.fromJson(Map<String, dynamic> json) {
    return Imovel(
        idImovel: json['idimovel'],
        titulo: json['titulo'],
        tipoImovel: json['tipoimovel'],
        nrComodo: json['nrcomodos'],
        nrQuarto: json['nrquarto'],
        nrBanheiro: json['nrbanheiro'],
        espacoGaragem: json['espaco_garagem'],
        dtCadastro: json['dtcadastro'],
        permitePet: json['idpermite_pet'],
        permiteCrianca: json['idpermite_crianca'],
        preco: json['preco'],
        descricao: json['descricao'],
        referencia: json['referencia'],
        idUsuario: json['idusuario']);
  }

  Map<String, dynamic> toJson() => {
        'idimovel': idImovel,
        'titulo': titulo,
        'tipoimovel': tipoImovel,
        'nrcomodo': nrComodo,
        'nrquarto': nrQuarto,
        'nrbanheiro': nrBanheiro,
        'espaco_garagem': espacoGaragem,
        'dtcadastro': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'idpermite_pet': permitePet,
        'idpermite_crianca': permiteCrianca,
        'preco': preco,
        'descricao': descricao,
        'referencia': referencia,
        'idusuario': idUsuario,
      };
}
