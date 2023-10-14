class FeedAluguel {
  int? id;
  String? titulo;
  String? endereco;
  double? preco;

  FeedAluguel(
      {required this.titulo, required this.endereco, required this.preco});

  FeedAluguel.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    endereco = json['endereco'];
    preco = json['endereco'];
  }

  Map<String, dynamic> toJson() =>
      {'titulo': titulo, 'endereco': endereco, 'preco': preco};
}
