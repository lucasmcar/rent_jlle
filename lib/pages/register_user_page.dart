import 'package:flutter/material.dart';
import 'package:imovel_direto/custom/custom_button.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';

class CriaUsuarioPage extends StatefulWidget {
  const CriaUsuarioPage({super.key});

  @override
  State<CriaUsuarioPage> createState() => _CriaUsuarioPageState();
}

class _CriaUsuarioPageState extends State<CriaUsuarioPage> {

  final _nameController = TextEditingController();
  final _senhaController = TextEditingController();
  final _userNameController = TextEditingController();
  final _userEmailController = TextEditingController();
  final _userFormKey = GlobalKey<FormState>();

  FocusNode focusColorChange = new FocusNode();
  bool textObscured = false;

  @override
  void initState() {
    // TODO: implement initState
    textObscured;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PaletaCores.bgPurpleAcc,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back_outlined),
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
                    bottomLeft: Radius.circular(40)
                  ),

                ),
                child: Column(

                  children: [
                    const Spacer( flex: 5,),
                    CircleAvatar(
                      radius: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: (){
                              },
                              icon: const Icon(Icons.add_a_photo_outlined, size: 32,)),
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.photo_album, size: 32,))
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("Cadastrar", style: TextStyle(
                          fontFamily: "Raleway",
                          color: PaletaCores.whiteDefault,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Form(
                  key: _userFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(padding: EdgeInsets.all(8),
                        child: TextFormField(
                          focusNode: focusColorChange,
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            enabledBorder:  OutlineInputBorder(
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
                                borderRadius: BorderRadius.all(Radius.circular(16))
                              )
                          ),

                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8),
                        child: TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc
                                  )

                              ),
                              labelText: "Nome de usuário",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc,
                                      style: BorderStyle.solid
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              )
                          ),

                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8),
                        child: TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc
                                  )

                              ),
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc,
                                      style: BorderStyle.solid
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              )
                          ),

                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8),
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
                                      ? Icon(Icons.visibility_outlined)
                                      : Icon(Icons.visibility_off_outlined)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc
                                  )

                              ),
                              labelText: "Senha",
                              labelStyle: TextStyle(
                                color: PaletaCores.bgPurpleAcc
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: PaletaCores.bgPurpleAcc,
                                      style: BorderStyle.solid
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              )
                          ),

                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8),

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
