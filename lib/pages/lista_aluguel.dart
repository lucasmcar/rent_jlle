import 'package:flutter/material.dart';
import 'package:imovel_direto/controller/casa_controller.dart';
import 'package:imovel_direto/models/imovel.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';


class ListaAluguel extends StatefulWidget {
  const ListaAluguel({super.key});

  @override
  State<ListaAluguel> createState() => _ListaAluguelState();
}

class _ListaAluguelState extends State<ListaAluguel> {
  final CasaController _casaController = CasaController();


  @override
  void initState() {
    super.initState();

    _casaController.getAll();
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
                    if (imovel == null) {
                      return const Center(
                        child: Text(
                          "Não há casas",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 26,
                              color: PaletaCores.bgPurpleAcc),
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 120,
                        child: Card(
                            elevation: 5,
                            margin: const EdgeInsets.all(4),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: (imovel.tipoImovel == "K")
                                        ? PaletaCores.bgPurple
                                        : (imovel.tipoImovel == "A")
                                            ? Colors.deepPurple
                                            : PaletaCores.bgPurpleAcc,
                                    child: Text("${imovel.tipoImovel}"),
                                  ),
                                  title: Text("${imovel.titulo}",
                                      style: const TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text("R\$${imovel.preco}",
                                      style: const TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold)),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.description,
                                      color: PaletaCores.bgPurple,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/details',
                                          arguments: imovel);
                                    },
                                  ),
                                ),
                              ),
                            )),
                      );
                    }
                  });
            }
            return Container();
          },
          future: _casaController.getAll(),
        ),
      ),
    );
  }
}
