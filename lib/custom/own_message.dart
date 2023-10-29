import 'package:flutter/material.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';

class OwnMessage extends StatelessWidget {
  final String? sender;
  final String? message;

  const OwnMessage({this.sender, this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 60),
        child: Card(
          color: Colors.purple,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$sender",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: PaletaCores.whiteDefault,
                        fontFamily: "Raleway")),
                const SizedBox(height: 8),
                Text("$message",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontFamily: "Raleway"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
