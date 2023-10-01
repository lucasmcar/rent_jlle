import 'package:flutter/material.dart';

import 'lista_aluguel.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alugueis"),
          backgroundColor: Colors.purpleAccent,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/createRent');
                },
                icon: Icon(Icons.add_circle))
          ],
        ),
        body: const ListaAluguel());
  }
}