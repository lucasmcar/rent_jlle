import 'dart:io';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:rent_jlle/custom/custom_button.dart';

class RegistraCasaPage extends StatefulWidget {
  const RegistraCasaPage({super.key});

  @override
  State<RegistraCasaPage> createState() => _RegistraCasaPageState();
}

class _RegistraCasaPageState extends State<RegistraCasaPage> {
  final _formKey = GlobalKey<FormState>();
  final List<File> _listaImagens = [];
  final List<DropdownMenuItem<String>> _menuItems = [];

  final _tituloController = TextEditingController();
  final _descController = TextEditingController();
  final _precoController = TextEditingController();

  @override
  void initState() {
    _carregaTipoImovel();
    super.initState();
  }

  void _carregaTipoImovel() {
    _menuItems.add(const DropdownMenuItem(
      value: 'K',
      child: Text("Kitnet"),
    ));
    _menuItems.add(const DropdownMenuItem(
      value: 'A',
      child: Text("Apto"),
    ));
    _menuItems.add(const DropdownMenuItem(
      value: 'C',
      child: Text("Casa"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova casa"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormField<List>(
                      initialValue: _listaImagens,
                      validator: (imagens) {
                        return imagens!.isEmpty
                            ? "Necessário selecionar uma imagem"
                            : null;
                      },
                      builder: (state) {
                        if (state.hasError) {
                          return Text(
                            "*${state.errorText}",
                            style: const TextStyle(color: Colors.red),
                          );
                        }
                        return SizedBox(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _listaImagens.length,
                              itemBuilder: (context, index) {
                                if (index == _listaImagens.length) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: const CircleAvatar(
                                        radius: 12.0,
                                        backgroundColor:
                                            Colors.deepPurpleAccent,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add_a_photo_rounded,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            Text("Adicionar")
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                if (index > 0) {}
                                return const SizedBox();
                              }),
                        );
                      }),
                  TextFormField(
                    controller: _tituloController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        labelText: "Digite um título",
                        floatingLabelStyle: TextStyle(
                          fontSize: 12.0,
                          fontStyle: FontStyle.normal,
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "O campo é obrigatório";
                      }
                      return "Tudo certo!";
                    },
                  ),
                  const SizedBox(height: 8.0),
                  DropdownButtonFormField(
                      items: _menuItems, onChanged: (valor) {}),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _descController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        labelText: "Descrição",
                        floatingLabelStyle: TextStyle(
                          fontSize: 12.0,
                          fontStyle: FontStyle.normal,
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "O campo é obrigatório";
                      }
                      return "Tudo certo!";
                    },
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    inputFormatters: [CentavosInputFormatter()],
                    controller: _precoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        labelText: "Preço",
                        floatingLabelStyle: TextStyle(
                          fontSize: 12.0,
                          fontStyle: FontStyle.normal,
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "O campo é obrigatório";
                      }
                      return "Tudo certo!";
                    },
                  ),
                  const SizedBox(height: 8.0),
                  CustomButton(
                      buttonText: "Cadastrar",
                      colorText: Colors.white,
                      onPressed: () {}),
                ],
              )),
        ),
      ),
    );
  }
}
