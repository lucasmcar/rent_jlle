import 'package:flutter/material.dart';
import 'package:imovel_direto/custom/custom_button.dart';
import 'package:imovel_direto/models/imovel.dart';
import 'package:imovel_direto/pages/user_profile_page.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';

class DetailsPage extends StatefulWidget {
  Imovel? imovel;

  DetailsPage(this.imovel, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool agendado = true;

  final _sc = ScrollController();

  List<String> images = [
    "https://www.quintoandar.com.br/img/med/893622058-947.047954695798601.jpg",
    "https://imgbr.imovelwebcdn.com/avisos/2/29/35/26/88/91/720x532/1316741154.jpg"
  ];
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Imóvel Ref. #${widget.imovel?.referencia}",
            style: const TextStyle(fontFamily: "Raleway", letterSpacing: .15),
          ),
          backgroundColor: PaletaCores.bgPurple,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
            PopupMenuButton(
                onSelected: _handleClick,
                itemBuilder: (context) {
                  return {'Perfil', 'Proprietário'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                }),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height * 1.2,
          decoration: const BoxDecoration(color: PaletaCores.whiteDefault),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1 / 3,
                child: PageView.builder(
                    itemCount: images.length,
                    pageSnapping: true,
                    itemBuilder: (context, pagePosition) {
                      return Image.network(
                        images[pagePosition],
                        fit: BoxFit.cover,
                      );
                    }),
              ),

              /*SizedBox(
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
              )*/

              Container(
                margin: const EdgeInsets.only(top: 5, left: 8, right: 8),
                height: 120,
                width: double.infinity,
                child: ListView(
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
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.25,
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                          child: Text(
                            "Endereço do imóvel",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rua:"),
                              Text("Cidade de Oros",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Bairro:"),
                              Text("Itaum",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: MediaQuery.of(context).size.height / 2.525,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      shape: BoxShape.rectangle,
                      color: PaletaCores.whiteDefault,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: Text(
                          "Resumo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 16, right: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.money_outlined,
                                size: 26, color: PaletaCores.bgPurple),
                            Text("R\$${widget.imovel?.preco}",
                                style: const TextStyle(
                                    fontFamily: "Raleway",
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey))
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 16, right: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              size: 26,
                              color: PaletaCores.bgPurple,
                            ),
                            Text(/*"R\$${widget.imovel?.preco}*/ "Alex Junior",
                                style: TextStyle(
                                    fontFamily: "Raleway",
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 16, left: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            (widget.imovel?.tipoImovel == "K")
                                ? const Icon(
                                    Icons.house_outlined,
                                    size: 24,
                                    color: PaletaCores.bgPurple,
                                  )
                                : (widget.imovel?.tipoImovel == "A")
                                    ? const Icon(
                                        Icons.apartment_outlined,
                                        size: 24,
                                        color: PaletaCores.bgPurple,
                                      )
                                    : const Icon(
                                        Icons.house_siding_outlined,
                                        size: 24,
                                        color: PaletaCores.bgPurple,
                                      ),
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
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 8.0, left: 16, right: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 26,
                              color: PaletaCores.bgPurple,
                            ),
                            Text("51996699337" /*R\$${widget.imovel?.preco}*/,
                                style: TextStyle(
                                    fontFamily: "Raleway",
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, right: 16, left: 16),
                            child: CustomButton(
                                buttonText: "Alugar",
                                bgColor: PaletaCores.bgPurple,
                                colorText: PaletaCores.whiteDefault,
                                onPressed: () {}),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, right: 16, left: 16),
                            child: CustomButton(
                              buttonText: "Visita",
                              bgColor: agendado
                                  ? Colors.white38
                                  : PaletaCores.bgPurpleAcc,
                              colorText: agendado
                                  ? Colors.black45
                                  : PaletaCores.whiteDefault,
                              onPressed: !agendado ? null : () {},
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  void _handleClick(String value) {
    switch (value) {
      case 'Perfil':
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext c) => const ProfileUserPage()));
        break;
      case 'Proprietario':
        break;
    }
  }
}
