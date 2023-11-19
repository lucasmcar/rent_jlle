import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imovel_direto/controller/casa_controller.dart';
import 'package:imovel_direto/custom/custom_button.dart';
import 'package:imovel_direto/custom/custom_int_input_form.dart';
import 'package:imovel_direto/custom/custom_title_text_form_field.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';

class RegisterHouseInfo extends StatefulWidget {
  const RegisterHouseInfo({super.key});

  @override
  State<RegisterHouseInfo> createState() => _RegisterHouseInfoState();
}

class _RegisterHouseInfoState extends State<RegisterHouseInfo> {
  final _formHouseKey = GlobalKey<FormState>();

  String? selectedValue;
  String? selectedValuePet;
  String? selectedValueCrianca;

  //Controllers
  final TextEditingController _descTituloController = TextEditingController();
  final TextEditingController _nrComodoController = TextEditingController();
  final TextEditingController _nrQuartoController = TextEditingController();
  final TextEditingController _nrBanheiroController = TextEditingController();
  final TextEditingController _espacoGaragemController =
      TextEditingController();

  final List<DropdownMenuItem<String>> _listaTipoCasas = [];
  final List<DropdownMenuItem<String>> _optCriancas = [];
  final List<DropdownMenuItem<String>> _optPet = [];

  //Instancia da classe imovelcontroller
  final CasaController casaController = CasaController();

  getOptCriancas() {
    _optCriancas.add(const DropdownMenuItem(
        value: "",
        child: Text("Escolha...", style: TextStyle(fontFamily: "Raleway"))));
    _optCriancas.add(const DropdownMenuItem(
        value: "S",
        child: Text("Sim", style: TextStyle(fontFamily: "Raleway"))));
    _optCriancas.add(const DropdownMenuItem(
        value: "N",
        child: Text("Não", style: TextStyle(fontFamily: "Raleway"))));
  }

  getOptPet() {
    _optPet.add(const DropdownMenuItem(
        value: "",
        child: Text("Escolha...", style: TextStyle(fontFamily: "Raleway"))));
    _optPet.add(const DropdownMenuItem(
        value: "S",
        child: Text("Sim", style: TextStyle(fontFamily: "Raleway"))));
    _optPet.add(const DropdownMenuItem(
        value: "N",
        child: Text("Não", style: TextStyle(fontFamily: "Raleway"))));
  }

  getTipoCasas() {
    _listaTipoCasas.add(const DropdownMenuItem(
        value: "",
        child: Text(
          "Escolha...",
          style: TextStyle(
            fontFamily: "Raleway",
          ),
        )));
    _listaTipoCasas.add(const DropdownMenuItem(
        value: "K",
        child: Text(
          "Kitnet",
          style: TextStyle(
            fontFamily: "Raleway",
          ),
        )));
    _listaTipoCasas.add(const DropdownMenuItem(
        value: "C",
        child: Text("Casa",
            style: TextStyle(
              fontFamily: "Raleway",
            ))));
    _listaTipoCasas.add(const DropdownMenuItem(
        value: "A",
        child: Text("Apartamento",
            style: TextStyle(
              fontFamily: "Raleway",
            ))));
  }

  @override
  void initState() {
    super.initState();
    casaController.countDataFilled = 0;
    casaController.countTotalFields = 0;
    getOptCriancas();
    getOptPet();
    getTipoCasas();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PaletaCores.bgPurple,
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        title: const Text(
          "Informações do imóvel",
          style: TextStyle(
            fontFamily: "Raleway",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formHouseKey,
                child: Column(
                  children: [
                    Observer(builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: CustomTitleTextFormField(
                          onChanged: (String? novoValor) {
                            if (novoValor!.isEmpty) {
                              casaController.setTotalFieldsDecrement();
                              casaController.setDecrementTotalFilledFields();
                            } else {
                              if (_descTituloController.text.isNotEmpty &&
                                  _descTituloController.text.length > 5) {
                                casaController.setTotalFilledFields();
                                casaController.setTotalFields();
                              }
                            }
                          },
                          controller: _descTituloController,
                        ),
                      );
                    }),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: DropdownButtonFormField<String>(
                        hint: const Text("Selecione um tipo"),
                        value: selectedValue,
                        items: _listaTipoCasas,
                        onChanged: (String? novoValor) {
                          if (novoValor == "") {
                            casaController.setTotalFieldsDecrement();
                            casaController.setDecrementTotalFilledFields();
                          } else {
                            if (_listaTipoCasas.isNotEmpty) {
                              casaController.setTotalFilledFields();
                              casaController.setTotalFields();
                              selectedValue = novoValor!;
                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: CustomIntInputForm(
                          onChanged: (String? novoValor) {
                            if (novoValor == "") {
                              casaController.setTotalFieldsDecrement();
                              casaController.setDecrementTotalFilledFields();
                            } else {
                              if (_nrComodoController.text.isNotEmpty &&
                                  _nrComodoController.text.length >= 1) {
                                casaController.setTotalFilledFields();
                                casaController.setTotalFields();
                              }
                            }
                          },
                          controller: _nrComodoController,
                          nome: "Comodo",
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: CustomIntInputForm(
                          onChanged: (String? novoValor) {
                            if (novoValor == "") {
                              casaController.setTotalFieldsDecrement();
                              casaController.setDecrementTotalFilledFields();
                            } else {
                              if (_nrQuartoController.text.isNotEmpty &&
                                  _nrQuartoController.text.length >= 1) {
                                casaController.setTotalFilledFields();
                                casaController.setTotalFields();
                              }
                            }
                          },
                          controller: _nrQuartoController,
                          nome: "Quarto",
                        ),
                      ))
                    ]),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: CustomIntInputForm(
                                  onChanged: (String? novoValor) {
                                    if (novoValor == "" && novoValor!.isEmpty) {
                                      casaController.setTotalFieldsDecrement();
                                      casaController
                                          .setDecrementTotalFilledFields();
                                    } else {
                                      if (_nrBanheiroController
                                              .text.isNotEmpty &&
                                          _nrBanheiroController.text.length >=
                                              1) {
                                        casaController.setTotalFilledFields();
                                        casaController.setTotalFields();
                                      }
                                    }
                                  },
                                  controller: _nrBanheiroController,
                                  nome: "Banheiro")),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: CustomIntInputForm(
                            onChanged: (String? novoValor) {
                              if (novoValor == "" && novoValor!.isEmpty) {
                                casaController.setDecrementTotalFilledFields();
                                casaController.setTotalFieldsDecrement();
                              } else {
                                if (_espacoGaragemController.text.isNotEmpty &&
                                    _espacoGaragemController.text.length >= 1) {
                                  casaController.setTotalFilledFields();
                                  casaController.setTotalFields();
                                }
                              }
                            },
                            controller: _espacoGaragemController,
                            nome: "Garagem",
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: DropdownButtonFormField<String>(
                                  icon: const Icon(
                                    Icons.child_care_outlined,
                                    color: PaletaCores.bgPurple,
                                  ),
                                  hint: const Text("Crianças",
                                      style: TextStyle(
                                        fontFamily: "Raleway",
                                      )),
                                  value: selectedValueCrianca,
                                  items: _optCriancas,
                                  onChanged: (String? novoValorCrianca) {
                                    if (novoValorCrianca == "") {
                                      casaController
                                          .setDecrementTotalFilledFields();
                                      casaController.setTotalFieldsDecrement();
                                    } else {
                                      if (_optCriancas.isNotEmpty) {
                                        selectedValueCrianca = novoValorCrianca;
                                        casaController.setTotalFilledFields();
                                        casaController.setTotalFields();
                                      }
                                    }
                                  },
                                ))),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: DropdownButtonFormField<String>(
                                icon: const Icon(Icons.pets_outlined,
                                    color: PaletaCores.bgPurple),
                                hint: const Text("Pet",
                                    style: TextStyle(
                                      fontFamily: "Raleway",
                                    )),
                                value: selectedValuePet,
                                items: _optPet,
                                onChanged: (String? valorPet) {
                                  if (valorPet == "") {
                                    casaController.setTotalFieldsDecrement();
                                    casaController
                                        .setDecrementTotalFilledFields();
                                  } else {
                                    if (_optPet.isNotEmpty) {
                                      selectedValuePet = valorPet;
                                      casaController.setTotalFilledFields();
                                      casaController.setTotalFields();
                                    }
                                  }
                                },
                              )),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: CustomButton(
                                buttonText: "Registrar",
                                colorText: PaletaCores.whiteDefault,
                                onPressed: casaController.countDataFilled >= 8
                                    ? () {
                                        print("Esta apertando");
                                      }
                                    : null,
                                bgColor: PaletaCores.bgPurple)),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 3),
              Card(
                elevation: 3,
                child: Observer(
                  builder: (_) {
                    return ListTile(
                      title: Text(
                          "Informações Preenchidas ${casaController.countTotalFields}/8"),
                      subtitle: casaController.countDataFilled >= 8
                          ? const Text(
                              "Todos os dados preenchidos",
                              style: TextStyle(
                                  fontFamily: "Raleway", color: Colors.green),
                            )
                          : const Text("Você precisa preencher alguns dados",
                              style: TextStyle(
                                  fontFamily: "Raleway", color: Colors.red)),
                      leading: casaController.countDataFilled >= 8
                          ? Icon(
                              Icons.check_circle_outline,
                              color: Colors.green[700],
                            )
                          : const Icon(
                              Icons.info_outline,
                              color: Colors.red,
                            ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
