import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:imovel_direto/custom/custom_title_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import 'package:imovel_direto/utils/colors/paleta_cores.dart';

import '../custom/custom_int_input_form.dart';
import '../models/imovel.dart';

class RegistraCasaPage extends StatefulWidget {
  const RegistraCasaPage({super.key});

  @override
  State<RegistraCasaPage> createState() => _RegistraCasaPageState();
}

class _RegistraCasaPageState extends State<RegistraCasaPage> {
  final _formHouseKey = GlobalKey<FormState>();
  final List<File?> _listaImagens = [];
  final List<DropdownMenuItem<String>> _listaTipoCasas = [];
  final List<DropdownMenuItem<String>> _optCriancas = [];
  final List<DropdownMenuItem<String>> _optPet = [];

  int currentStep = 0;
  String? selectedValue;
  String? selectedValuePet;
  String? selectedValueCrianca;

  final _descTituloController = TextEditingController();
  final _nrComodoController = TextEditingController();
  final _nrQuartoController = TextEditingController();
  final _nrBanheiroController = TextEditingController();
  final _espacoGaragemController = TextEditingController();
  final _priceController = TextEditingController();
  final _descDetailsController = TextEditingController();
  //var status = await Permission.storage.status;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    File file = File(img!.path);

    setState(() {
      _listaImagens.add(file);
    });
  }

  Future<void> createRent(Imovel imovel) async {
    String url = "http://192.168.100.123:4000";

    try {
      http.Response response = await http.post(
        Uri.parse("$url/api/imovel/novo"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "titulo": imovel.titulo,
          "tipoimovel": imovel.tipoImovel,
          "nrcomodos": imovel.nrComodo,
          "nrquarto": imovel.nrQuarto,
          "nrbanheiro": imovel.nrBanheiro,
          "dtcadastro": imovel.dtCadastro,
          "idpermite_pet": imovel.permitePet,
          "idpermite_crianca": imovel.permiteCrianca,
          "espaco_garagem": imovel.espacoGaragem,
          "preco": imovel.preco,
          "descricao": imovel.descricao,
          "referencia": imovel.referencia,
          "idusuario": imovel.idUsuario
        }),
      );
    } on HttpException catch (ex) {
      throw Exception(ex.message.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getTipoCasas();
    getOptCriancas();
    getOptPet();
  }

  getOptCriancas() {
    _optCriancas.add(const DropdownMenuItem(value: "S", child: Text("Sim")));
    _optCriancas.add(const DropdownMenuItem(value: "N", child: Text("Não")));
  }

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text("Dados"),
            content: Form(
              key: _formHouseKey,
              child: Column(
                children: [
                  CustomTitleTextFormField(controller: _descTituloController),
                  const SizedBox(height: 8.0),
                  DropdownButtonFormField<String>(
                    hint: const Text("Selecione um tipo"),
                    value: selectedValue,
                    items: _listaTipoCasas,
                    onChanged: (String? novoValor) {
                      setState(() {
                        selectedValue = novoValor!;
                      });
                    },
                  ),
                  const SizedBox(height: 8.0),
                  Row(children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: CustomIntInputForm(
                        controller: _nrComodoController,
                        nome: "Comodo",
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: CustomIntInputForm(
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
                            controller: _nrBanheiroController,
                            nome: "Banheiro"),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: CustomIntInputForm(
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
                                hint: const Text("Crianças"),
                                value: selectedValueCrianca,
                                items: _optCriancas,
                                onChanged: (String? novoValorCrianca) {
                                  setState(() {
                                    selectedValueCrianca = novoValorCrianca!;
                                  });
                                },
                              ))),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: DropdownButtonFormField<String>(
                              icon: const Icon(Icons.pets_outlined,
                                  color: PaletaCores.bgPurple),
                              hint: const Text("Pet"),
                              value: selectedValuePet,
                              items: _optPet,
                              onChanged: (String? valorPet) {
                                setState(() {
                                  selectedValuePet = valorPet!;
                                });
                              },
                            )),
                      )
                    ],
                  )
                ],
              ),
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text("Detalhes"),
            content: Column(
              children: [
                TextFormField(
                  controller: _priceController,
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
                ),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                  controller: _descDetailsController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      labelText: "Descrição",
                      floatingLabelStyle: TextStyle(
                        fontSize: 12.0,
                        fontStyle: FontStyle.normal,
                      )),
                )
              ],
            )),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text("Visualizar Dados"),
            content: const Text("Vizualização dos dados"))
      ];

  getOptPet() {
    _optPet.add(const DropdownMenuItem(value: "S", child: Text("Sim")));
    _optPet.add(const DropdownMenuItem(value: "N", child: Text("Não")));
  }

  getTipoCasas() {
    _listaTipoCasas
        .add(const DropdownMenuItem(value: "K", child: Text("Kitnet")));
    _listaTipoCasas
        .add(const DropdownMenuItem(value: "C", child: Text("Casa")));
    _listaTipoCasas
        .add(const DropdownMenuItem(value: "A", child: Text("Apartamento")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova casa"),
        backgroundColor: Colors.purple,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepCancel: () {
          currentStep == 0 ? null : setState(() => currentStep -= 1);
        },
        onStepContinue: () {
          final isLastStep = currentStep == getSteps().length - 1;

          if (isLastStep) {
            var titulo = _descTituloController.text;
            var qtdComodo = _nrComodoController.text;
            var qtdQuarto = _nrQuartoController.text;
            var qtdBanheiro = _nrBanheiroController.text;
            var espacoGaragem = _espacoGaragemController.text;
            var preco = _priceController.text;
            var descricao = _descDetailsController.text;
            var referencia = _setRefHash();
            Imovel imovel = Imovel(
                titulo: titulo,
                tipoImovel: selectedValue,
                nrComodo: qtdComodo,
                nrQuarto: qtdQuarto,
                nrBanheiro: qtdBanheiro,
                espacoGaragem: espacoGaragem,
                dtCadastro: DateFormat('yyyy-MM-dd').format((DateTime.now())),
                permitePet: selectedValuePet,
                permiteCrianca: selectedValueCrianca,
                preco: double.parse(preco),
                descricao: descricao,
                referencia: referencia.toString(),
                idUsuario: '1');
            createRent(imovel);
          } else {
            setState(() {
              currentStep += 1;
            });
          }
        },
        controlsBuilder: (context, ControlsDetails details) {
          final isLastStep = currentStep == getSteps().length - 1;
          return Container(
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purpleAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(color: Colors.purple)))),
                  onPressed: details.onStepContinue,
                  child: Text(isLastStep ? "Finalizar" : "Próximo"),
                )),
                const SizedBox(width: 16),
                currentStep != 0
                    ? Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 241, 239, 241)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      side: const BorderSide(
                                          color: Colors.purple)))),
                          onPressed: details.onStepCancel,
                          child: const Text("Voltar"),
                        ),
                      )
                    : Container()
              ],
            ),
          );
        },
      ),
    );
  }

  int _setRefHash() {
    return Random().nextInt(999999);
  }
}
