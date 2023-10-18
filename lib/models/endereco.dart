import 'dart:convert';

class Endereco {
  String? cep;
  String? rua;
  String? bairro;
  String? localidade;
  String? uf;

  Endereco({this.cep, this.rua, this.bairro, this.localidade, this.uf});

  factory Endereco.fromJson(String str) => Endereco.fromMap(json.decode(str));

  String toJson(dadosJson) => json.encode(toMap());

  factory Endereco.fromMap(Map<String, dynamic> json) => Endereco(
      cep: json["cep"],
      rua: json["rua"],
      bairro: json["bairro"],
      localidade: json["localidade"],
      uf: json["uf"]);

  Map<String, dynamic> toMap() => {
        "cep": cep,
        "logradouro": rua,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
      };
}
