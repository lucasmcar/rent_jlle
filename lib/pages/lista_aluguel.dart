import 'dart:io';
import 'package:flutter/material.dart';
import 'package:imovel_direto/models/imovel.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';
import '../models/feed_aluguel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListaAluguel extends StatefulWidget {
  const ListaAluguel({super.key});

  @override
  State<ListaAluguel> createState() => _ListaAluguelState();
}

class _ListaAluguelState extends State<ListaAluguel> {
  Future<List<Imovel>> _getHouses() async {
    String url = "http://192.168.100.123:4000";

    http.Response response;

    try {
      response = await http.get(Uri.parse("$url/api/imoveis"));
      var dadosJson = jsonDecode(response.body);

      List<Imovel> imoveis = [];
      for (var imovel in dadosJson) {
        Imovel i = Imovel(
          idImovel: imovel['idimovel'],
          titulo: imovel["titulo"],
          tipoImovel: imovel["tipoimovel"],
          nrComodo: imovel["nrcomodos"],
          nrQuarto: imovel["nrquarto"],
          nrBanheiro: imovel["nrbanheiro"],
          espacoGaragem: imovel["espaco_garagem"],
          permitePet: imovel["idpermite_pet"],
          permiteCrianca: imovel["idpermite_crianca"],
          dtCadastro: imovel["dtcadastro"],
          idUsuario: imovel["idusuario"].toString(),
          descricao: imovel["descricao"],
          referencia: imovel["referencia"],
          preco: double.parse(imovel["preco"] ?? "0.0"),
        );

        imoveis.add(i);
      }
      if (response.statusCode == 200) {
        return imoveis;
      }
    } on HttpException catch (ex) {
      showDialog(
          context: context,
          builder: (BuildContext c) => Dialog(
                child: Column(
                  children: [
                    const Text("Não foi possível carregar os dados"),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Fechar"))
                  ],
                ),
              ));
    }
    throw Exception("No data");
  }

  @override
  void initState() {
    super.initState();

    _getHouses();
  }

  bool isSearching = false;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: 'Pesquisar Bairro ou referência',
                    hintStyle:
                        TextStyle(fontFamily: "Raleway", color: Colors.white)),
              )
            : const Text(
                "Imóveis",
                style: TextStyle(fontFamily: "Raleway", letterSpacing: .5),
              ),
        titleSpacing: 10,
        backgroundColor: PaletaCores.bgPurple,
        actions: [
          isSearching
              ? IconButton(
                  icon: const Icon(Icons.close_outlined),
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                    });
                  })
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                    });
                  },
                )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List<Imovel>>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return Container();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: PaletaCores.bgPurple,
                  strokeWidth: 2,
                  value: null,
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    List<Imovel> listaImoveis = snapshot.data!;
                    Imovel imovel = listaImoveis[index];
                    if(imovel == null){
                      return const Center(
                        child: Text(
                          "Não há casas",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 26,
                              color: PaletaCores.bgPurpleAcc
                          ),
                        ),
                      );
                    } else {
                      return ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/details',
                              arguments: imovel);
                        },
                        style: ListTileStyle.drawer,
                        contentPadding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        title: Text(
                          imovel.titulo!,
                          style: const TextStyle(
                              fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("R\$${imovel.preco}",
                            style: const TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic)),
                        trailing: IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () {},
                        ),
                        shape: const Border(
                            bottom: BorderSide(
                                width: 0.5, color: PaletaCores.bgPurpleAcc)),
                      );
                    }

                  });
            }
            return Container();
          },
          future: _getHouses(),
        ),
      ),
    );
  }
}
