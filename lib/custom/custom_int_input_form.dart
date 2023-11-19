import 'package:flutter/material.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';

class CustomIntInputForm extends StatelessWidget {
  final String nome;
  final TextEditingController controller;
  final Function(String?) onChanged;
 

  const CustomIntInputForm(
      {required this.nome,
      required this.controller,
      required this.onChanged,

      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            prefixIcon: (nome == "Banheiro")
                ? const Icon(
                    Icons.bathroom_outlined,
                    color: PaletaCores.bgPurple,
                  )
                : (nome == "Garagem")
                    ? const Icon(
                        Icons.garage_outlined,
                        color: PaletaCores.bgPurple,
                      )
                    : (nome == "Comodo")
                        ? const Icon(
                            Icons.house_outlined,
                            color: PaletaCores.bgPurple,
                          )
                        : const Icon(
                            Icons.bed_outlined,
                            color: PaletaCores.bgPurple,
                          ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            labelText: (nome == "Garagem") ? "Nº Carros" : "Nº ${nome}s",
            floatingLabelStyle: const TextStyle(
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
