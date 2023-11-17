import 'package:flutter/material.dart';
import 'package:imovel_direto/models/Usuario.dart';

import '../utils/colors/paleta_cores.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {

  Future<Usuario> _getUserData() async{
      throw Exception("Not implemented yet");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    PaletaCores.bgPurple,
                    PaletaCores.bgPurpleAcc
                  ],
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.60,
                child: const Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://img.freepik.com/fotos-gratis/uma-garota-com-um-moletom-que-diz-eu-sou-uma-garota_1340-45021.jpg?size=626&ext=jpg&ga=GA1.1.386372595.1698019200&semt=ais"
                        ),
                        radius: 60,
                      ),
                      SizedBox(height: 4,),
                      Text(
                        "Fulana de tal",
                         style: TextStyle(
                            fontFamily: "Raleway",
                            color: PaletaCores.whiteDefault,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16,),
                      Card(
                        margin: EdgeInsetsDirectional.symmetric(horizontal: 20.0 , vertical: 2.0),
                        elevation: 5,
                        color: PaletaCores.whiteDefault,
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(

                                    children: [
                                      Text("Idade",
                                          style: TextStyle(
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16
                                          )),
                                      SizedBox(height: 8.0),
                                      Text("26"),
                                    ],
                                  )
                              ),
                              Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Avaliação",
                                        style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        )
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.star_border_outlined),
                                          Text("5.0")
                                        ],
                                      )
                                    ],
                                  )
                              ),
                              Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                          "Entrada",
                                          style: TextStyle(
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16
                                          )),
                                      SizedBox(height: 8.0),
                                      Text("26/10/2023"),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
              ]
            ),
          Positioned(
              bottom: 0,
              child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.2,
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

                )
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Teste"),
                      Text("Teste"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Teste"),
                      Text("Teste"),
                    ],
                  ),
                )


              ],
            ),
          ))

        ],
      )







      /*Container(

        padding: const EdgeInsets.all(8),
        child: FutureBuilder<Usuario>(
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
              return Container(

              );


              /*ListView.builder(
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
                return Container(

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
                              ? PaletaCores.bgPurple : (imovel.tipoImovel == "A")
                                ? Colors.deepPurple : PaletaCores.bgPurpleAcc,
                                child: Text("${imovel.tipoImovel}"),
                          ),
                        title: Text("${imovel.titulo}",
                        style: const TextStyle(
                          fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                          subtitle: Text("R\$${imovel.preco}",
                            style: const TextStyle(
                            fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                            trailing: IconButton(
                              icon: const Icon(Icons.description, color: PaletaCores.bgPurple,),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/details',
                                    arguments: imovel);
                                },
                              ),
                            ),
                      ),
    )),
    );

    }});*/



    }
    return Container();
    },
    future: _getUserData(),
    )*/
    );
  }
}


