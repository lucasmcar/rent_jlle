import 'package:flutter/material.dart';
import 'package:imovel_direto/custom/custom_button.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({super.key});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Detalhes")),
        body: Column(
          children: [
            PageView.builder(itemCount: 2, itemBuilder: (context, index) {
              return null;
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    buttonText: "Agendar Visita",
                    colorText: PaletaCores.bgPurpleAcc,
                    bgColor: Colors.white,
                    onPressed: () {}),
                CustomButton(
                    buttonText: "Alugar",
                    bgColor: PaletaCores.bgPurple,
                    colorText: Colors.white,
                    onPressed: () {}),
              ],
            )
          ],
        ));
  }
}
