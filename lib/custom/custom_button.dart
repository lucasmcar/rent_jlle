import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color colorText;
  final VoidCallback onPressed;

  const CustomButton(
      {required this.buttonText,
      required this.colorText,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.purpleAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: const BorderSide(color: Colors.purple)))),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          buttonText,
          style: TextStyle(color: colorText, fontSize: 16),
        ),
      ),
    );
  }
}
