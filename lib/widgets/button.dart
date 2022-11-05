import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function callbackFunction;
  final double width;
  final double height;
  final Color textColor;
  final Color bgColor;
  final String? btnText;
  const MyButton(
      {Key? key,
      required this.callbackFunction,
      required this.width,
      required this.height,
      required this.btnText,
      required this.bgColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callbackFunction(btnText);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        padding: const EdgeInsets.symmetric(vertical: 0),
        onPrimary: textColor,
        primary: bgColor,
        shape: const CircleBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Text(
          btnText.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
