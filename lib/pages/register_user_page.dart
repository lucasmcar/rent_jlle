import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imovel_direto/controller/usuario_controller.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';
import 'package:mobx/mobx.dart';

class CriaUsuarioPage extends StatefulWidget {
  const CriaUsuarioPage({super.key});

  @override
  State<CriaUsuarioPage> createState() => _CriaUsuarioPageState();
}

class _CriaUsuarioPageState extends State<CriaUsuarioPage> {
  //controllers
  final _nomeController = TextEditingController();
  final _userNameController = TextEditingController();

  //formKey
  final _createUserFormKey = GlobalKey<FormState>();

  final FocusNode _focus = FocusNode();
  final UsuarioController userController = UsuarioController();

  ReactionDisposer? reactionDisposer;

  FocusNode focusColorChange = FocusNode();

  bool validUser = false;

  @override
  void initState() {
    textObscured;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _focus.dispose();
    reactionDisposer!();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    reactionDisposer = reaction((_) => userController.isValidUser, (valor) {});
  }

  //Esconde ou mostra o texto da senha
  bool textObscured = false;
  final bool _userEdited = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [PaletaCores.bgPurpleAcc, PaletaCores.bgPurple]),
                  shape: BoxShape.rectangle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(radius: 50, child: Text("U")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Icon(Icons.camera)),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Icon(Icons.browse_gallery))
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Form(
                  key: _createUserFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Input nome
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: TextFormField(
                          controller: _nomeController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                  fontFamily: "Raleway",
                                  color: PaletaCores.bgPurpleAcc),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: PaletaCores.bgPurpleAcc),
                                  borderRadius: BorderRadius.circular(16)),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc)),
                              labelText: "Nome",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: focusColorChange.hasFocus
                                          ? PaletaCores.bgPurpleAcc
                                          : PaletaCores.bgPurple,
                                      style: BorderStyle.solid),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)))),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      //Input username
                      Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16, top: 4),
                        child: Observer(builder: (_) {
                          return TextFormField(
                            onChanged: (valor) {
                              if (valor.isEmpty) {
                                validUser = false;
                              }
                              userController.isValidUserName(valor);
                              if (userController.loading) {
                                setState(() {
                                  validUser = userController.isValidUser;
                                });
                              }
                            },
                            validator: (value) {
                              bool isVal = userController.isValidUser;
                              if (value != null && !isVal) {
                                return "O nome já existe";
                              } else {
                                return "O nome é válido";
                              }
                            },
                            controller: _userNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                suffix: userController.loading
                                    ? Container(
                                        height: 12,
                                        width: 12,
                                        alignment: Alignment.center,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ))
                                    : (validUser)
                                        ? const Icon(
                                            Icons.check_circle_outlined,
                                            size: 16,
                                            color: PaletaCores.bgPurple,
                                          )
                                        : const Icon(
                                            Icons.error_outline_outlined,
                                            size: 16,
                                            color: Colors.red,
                                          ),
                                labelStyle: const TextStyle(
                                    fontFamily: "Raleway",
                                    color: PaletaCores.bgPurpleAcc),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: PaletaCores.bgPurpleAcc),
                                    borderRadius: BorderRadius.circular(16)),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                        color: PaletaCores.bgPurpleAcc)),
                                labelText: "Nome de usuário",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: focusColorChange.hasFocus
                                            ? PaletaCores.bgPurpleAcc
                                            : PaletaCores.bgPurple,
                                        style: BorderStyle.solid),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)))),
                          );
                        }),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}





/* import 'dart:io';



class _CriaUsuarioPageState extends State<CriaUsuarioPage> {

  final _nameController = TextEditingController();
  final _senhaController = TextEditingController();
  final _userEmailController = TextEditingController();
  final _userFormKey = GlobalKey<FormState>();
  final List<File?> _listaImagens = [];
  String? img;
  //we can upload image from camera or from gallery based on parameter

  FocusNode focusColorChange = new FocusNode();
  bool textObscured = false;
  bool _userEdited = false;

  @override
  void initState() {
    // TODO: implement initState
    textObscured;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String  _containerName = _nameController.text;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PaletaCores.bgPurpleAcc,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3.5,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [PaletaCores.bgPurpleAcc, PaletaCores.bgPurple]
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),

                  ),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("Cadastrar", style: TextStyle(
                            fontFamily: "Raleway",
                            color: PaletaCores.whiteDefault,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),

                    CircleAvatar(
                      backgroundImage: AssetImage(img!),
                      backgroundColor: const Color.fromRGBO(255, 255, 255, .5),
                      radius: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(

                              onPressed: (){
                                setState(() {
                                  ImagePicker().pickImage(source: ImageSource.gallery ).then((file){
                                    if(file == null) return;
                                        img = file.path;

                                  });
                                });

                              },
                              icon: const Icon(Icons.add_a_photo_outlined, size: 32,)),
                          IconButton(
                              onPressed: (){

                              },
                              icon: const Icon(Icons.photo_album, size: 32,))
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(8),
                    child: Align(

                      alignment: Alignment.center,
                      child: Text(_containerName ?? "", style: const TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 20,
                          color: PaletaCores.whiteDefault,
                          fontWeight: FontWeight.bold
                      ),),
                    ))


                  ],
                ),
              ),
              Container(

                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _userFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          focusNode: focusColorChange,
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                            fontFamily: "Raleway",
                            color: PaletaCores.bgPurpleAcc
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: PaletaCores.bgPurpleAcc),
                              borderRadius: BorderRadius.circular(16)
                            ),
                            enabledBorder:  const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: PaletaCores.bgPurpleAcc
                              )

                            ),
                              labelText: "Nome",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(

                                  color: focusColorChange.hasFocus ? PaletaCores.bgPurpleAcc : PaletaCores.bgPurple,
                                  style: BorderStyle.solid
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(16))
                              )
                          ),
                          onChanged: (text) {
                            _userEdited = true;
                            setState(() {
                              _containerName = text;
                            });
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: _userNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                fontFamily: "Raleway",
                                color: PaletaCores.bgPurpleAcc,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:   const BorderSide(color: PaletaCores.bgPurpleAcc,),
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc
                                  )

                              ),
                              labelText: "Nome de usuário",
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc,
                                      style: BorderStyle.solid
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              )
                          ),

                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: _userEmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelStyle: const TextStyle(
                              fontFamily: "Raleway",
                              color: PaletaCores.bgPurpleAcc,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:  const BorderSide(
                                  color: PaletaCores.bgPurpleAcc
                                ),
                                borderRadius: BorderRadius.circular(16)
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc
                                  )

                              ),
                              labelText: "Email",
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc,
                                      style: BorderStyle.solid
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              )
                          ),

                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(8),
                        child: TextFormField(

                          obscureText: !textObscured,
                          controller: _senhaController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(

                              suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      textObscured = !textObscured;
                                    });
                                  },
                                  icon: textObscured
                                      ? const Icon(Icons.visibility_outlined)
                                      : const Icon(Icons.visibility_off_outlined)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide( color: PaletaCores.bgPurpleAcc),
                                borderRadius: BorderRadius.circular(16)
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc
                                  )

                              ),
                              labelText: "Senha",
                              labelStyle: const TextStyle(
                                fontFamily: "Raleway",
                                color: PaletaCores.bgPurpleAcc
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc,
                                      style: BorderStyle.solid
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              )
                          ),

                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*.12,
                      ),
                      Padding(padding: const EdgeInsets.all(8),

                        child: CustomButton(
                          buttonText: "Cadastrar",
                          onPressed: (){},
                          bgColor: Colors.purple,
                          colorText: PaletaCores.whiteDefault,
                        ),
                      )

                    ],
                  ),
                )
              )
            ],
          ),

        ),
      )
    );
  }
}
 */