import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:imovel_direto/controller/casa_controller.dart';
import 'package:imovel_direto/models/tarefa.dart';
import 'package:imovel_direto/utils/labels_util.dart';
import 'package:flutter/material.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';

class RegistraCasaPage extends StatefulWidget {
  const RegistraCasaPage({super.key});

  @override
  State<RegistraCasaPage> createState() => _RegistraCasaPageState();
}

class _RegistraCasaPageState extends State<RegistraCasaPage> {
  var encoded =
      LabelsUtil().getLabelFromJson("lib/consts/labels/house/house.json");
  final List<File?> _listaImagens = [];

  CasaController casaController = CasaController();

  final List<Tarefa> tarefas = [Tarefa(name: "Informação", isCompleted: true)];

  int currentStep = 0;

  final _priceController = TextEditingController();
  final _descDetailsController = TextEditingController();
  final _cepSearchController = TextEditingController();
  final _ruaController = TextEditingController();
  final _numeroCasaController = TextEditingController();
  final _localidadeController = TextEditingController();
  final _bairroController = TextEditingController();
  final _ufController = TextEditingController();
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

  @override
  void initState() {
    super.initState();
    print(encoded);
    casaController.countDataFilled;
  }

  List<Step> getSteps() => [
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text("Detalhes",
                style: TextStyle(
                  fontFamily: "Raleway",
                )),
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
                        fontFamily: "Raleway",
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
                        fontFamily: "Raleway",
                        fontSize: 12.0,
                        fontStyle: FontStyle.normal,
                      )),
                )
              ],
            )),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text(
              "Visualizar Dados",
              style: TextStyle(
                fontFamily: "Raleway",
              ),
            ),
            content: const Text("Vizualização dos dados"))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Nova casa",
            style: TextStyle(fontFamily: "Raleway"),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(4),
              child: Card(
                borderOnForeground: true,
                elevation: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Informações do proprietário",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w700,
                              color: PaletaCores.bgPurple),
                        )),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Nome: ",
                                style: TextStyle(fontFamily: "Raleway"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("Usuário 1 ",
                                  style: TextStyle(fontFamily: "Raleway")),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("Email: ",
                                  style: TextStyle(fontFamily: "Raleway")),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("teste@teste.com ",
                                  style: TextStyle(fontFamily: "Raleway")),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("Telefone: ",
                                  style: TextStyle(fontFamily: "Raleway")),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("(99)99999999 "),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: LinearProgressIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Card(
                elevation: 3,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  dense: false,
                  visualDensity: VisualDensity(vertical: 4),
                  leading: const Icon(
                    Icons.info_outline,
                    size: 36,
                  ),
                  title: const Text(
                    "Detalhes do imóvel",
                    style: TextStyle(
                        fontFamily: "Raleway",
                        color: PaletaCores.bgPurple,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: const Text(
                    "Escreva as informações sobre a casa",
                    style: TextStyle(color: PaletaCores.bgPurpleAcc),
                  ),
                  trailing: const Icon(Icons.chevron_right_outlined),
                  onTap: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Card(
                elevation: 3,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  dense: false,
                  visualDensity: const VisualDensity(vertical: 4),
                  leading: const Icon(
                    Icons.location_on_outlined,
                    size: 36,
                  ),
                  title: const Text(
                    "Endereço",
                    style: TextStyle(
                        fontFamily: "Raleway",
                        color: PaletaCores.bgPurple,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: const Text(
                    "Escreva a localização",
                    style: TextStyle(
                        color: PaletaCores.bgPurpleAcc, fontFamily: "Raleway"),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right_outlined,
                  ),
                  onTap: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Card(
                elevation: 3,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  dense: false,
                  visualDensity: VisualDensity(vertical: 4),
                  leading: const Icon(Icons.photo, size: 36),
                  title: const Text(
                    "Imagens",
                    style: TextStyle(
                        fontFamily: "Raleway",
                        color: PaletaCores.bgPurple,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text("Não implementado"),
                  trailing: const Icon(Icons.chevron_right_outlined),
                  onTap: () {},
                ),
              ),
            ),
          ],
        )

        /*Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepCancel: () {
          currentStep == 0 ? null : setState(() => currentStep -= 1);
        },
        onStepContinue: () {
          final isLastStep = currentStep == getSteps().length - 1;
          /*if (currentStep == 2) {
            Usuario u = Usuario(
              idUsuario: 1,
              nome: "Teste",
              nmUsuario: "teste90",
              senha: "123",
              email: "teste@teste.com",
              contato: "4795959595",
              tipoUsuario: "L",
            );
            
            Endereco endereco = Endereco();
            var rua = _ruaController;
            var 

            _endController.registerAddress("http://192.168.100.123:4000",
                endereco, u.idUsuario as Usuario);
          }*/
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
            Navigator.pop(context);
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
                                  const Color.fromARGB(255, 209, 142, 209)),
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
      ),*/
        );
  }
}
