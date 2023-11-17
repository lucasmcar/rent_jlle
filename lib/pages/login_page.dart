import 'package:flutter/material.dart';

import '../utils/colors/paleta_cores.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: const Text("Teste")
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                height: MediaQuery.of(context).size.height/2.525,
                width: MediaQuery.of(context).size.width,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("TESTE")
                ]
            )
              ))]
        ),

      ),
    );
  }
}
