import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color colorText;
  final Color bgColor;
  final VoidCallback? onPressed;

  const CustomButton(
      {required this.buttonText,
      required this.colorText,
      required this.onPressed,
      required this.bgColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(bgColor),
          backgroundColor:
              MaterialStateProperty.all<Color>(bgColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: const BorderSide(color: Colors.purple)))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          buttonText,
          style: TextStyle(color: colorText, fontSize: 18, fontFamily: "Raleway", fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
