import 'package:flutter/material.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';

class CustomTitleTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? validator;

  const CustomTitleTextFormField(
      {required this.controller, this.validator, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.abc,
              color: PaletaCores.bgPurple,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            labelText: "Título",
            floatingLabelStyle: TextStyle(
              fontFamily: "Raleway",
              fontSize: 12.0,
              fontStyle: FontStyle.normal,
            )),
        validator: (valor) {
          if (valor!.isEmpty) {
            return "O campo não pode ser vazio";
          }
          return null;
        });
  }
}
