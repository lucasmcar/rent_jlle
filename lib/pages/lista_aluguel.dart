import 'package:flutter/material.dart';
import '../models/feed_aluguel.dart';

class ListaAluguel extends StatefulWidget {
  const ListaAluguel({super.key});

  @override
  State<ListaAluguel> createState() => _ListaAluguelState();
}

class _ListaAluguelState extends State<ListaAluguel> {
  List<FeedAluguel> alugueis = [
    FeedAluguel(titulo: "Alugue1", endereco: "Teste", preco: 20),
    FeedAluguel(titulo: "Alugue2", endereco: "Teste2", preco: 30),
  ];

  /*Future<List<FeedAluguel>> _getHouse() async {

  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
          itemCount: alugueis.length,
          itemBuilder: (context, index) {
            final aluguel = alugueis[index];

            return ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              title: Text(
                aluguel.titulo!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(aluguel.endereco!),
              trailing: Text("R\$${aluguel.preco}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
            );
          }),
    );
  }
}
