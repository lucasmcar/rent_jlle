import 'package:flutter/material.dart';
import 'package:imovel_direto/models/imovel.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';

class DetailsPage extends StatefulWidget {
  Imovel? imovel;

  DetailsPage(this.imovel, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Imóvel Ref. #${widget.imovel?.referencia}",
            style: const TextStyle(fontFamily: "Raleway", letterSpacing: .15),
          ),
          backgroundColor: PaletaCores.bgPurple,
          actions: const [],
        ),
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height * 1,
          color: const Color.fromARGB(255, 231, 231, 230),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Descrição:",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Text("${widget.imovel?.descricao}",
                          style: const TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Valor: ",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    Text("R\$${widget.imovel?.preco}",
                        style: const TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Tipo:",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    (widget.imovel?.tipoImovel == "K")
                        ? const Text("Kitnet",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey))
                        : widget.imovel?.tipoImovel == "C"
                            ? const Text("Casa",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey))
                            : const Text("Apartamento",
                                style: TextStyle(
                                    fontFamily: "Raleway",
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80),
                height: 120,
                width: double.infinity,
                child: ListView(
                  padding: const EdgeInsets.all(4),
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        Card(
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Nº Quartos",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.bed_outlined,
                                      color: PaletaCores.bgPurple),
                                  Text(
                                    "${widget.imovel!.nrQuarto}",
                                    style: const TextStyle(
                                        color: PaletaCores.bgPurple),
                                  )
                                ],
                              )),
                        ),
                        Card(
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Permite Pets?",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  (widget.imovel?.permitePet == 'S')
                                      ? const Icon(Icons.pets_outlined,
                                          color: PaletaCores.bgPurple)
                                      : const Icon(Icons.block_outlined,
                                          color: Colors.red),
                                  (widget.imovel?.permitePet == 'S')
                                      ? const Text("Permite",
                                          style: TextStyle(
                                              fontFamily: "Raleway",
                                              color: PaletaCores.bgPurple))
                                      : const Text(
                                          "Não permite",
                                          style: TextStyle(color: Colors.red),
                                        )
                                ],
                              )),
                        ),
                        Card(
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Permite Crianças?",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  (widget.imovel?.permiteCrianca == 'S')
                                      ? const Icon(Icons.child_care_outlined,
                                          color: PaletaCores.bgPurple)
                                      : const Icon(Icons.block_outlined,
                                          color: Colors.red),
                                  (widget.imovel?.permiteCrianca == 'S')
                                      ? const Text("Permite",
                                          style: TextStyle(
                                              color: PaletaCores.bgPurple))
                                      : const Text("Não permite",
                                          style: TextStyle(color: Colors.red))
                                ],
                              )),
                        ),
                        Card(
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Garagem",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  (widget.imovel?.espacoGaragem != '0')
                                      ? const Icon(Icons.garage_outlined,
                                          color: PaletaCores.bgPurple)
                                      : const Icon(Icons.block_outlined,
                                          color: Colors.red),
                                  (widget.imovel?.espacoGaragem != '0')
                                      ? Text(
                                          "${widget.imovel?.espacoGaragem}",
                                          style: const TextStyle(
                                              fontFamily: "Raleway",
                                              color: PaletaCores.bgPurple),
                                        )
                                      : const Text(
                                          "Sem garagem",
                                          style: TextStyle(
                                              fontFamily: "Raleway",
                                              color: Colors.red),
                                        )
                                ],
                              )),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
