import 'package:flutter/material.dart';

import '../models/FeedAluguel.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: alugueis.length,
            itemBuilder: (context, index) {
              FeedAluguel aluguel = alugueis[index];

              return ListTile(
                contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                onTap: () {
                  Navigator.pushNamed(context, '/details');
                },
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
            }));
  }
}
