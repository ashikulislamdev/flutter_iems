import 'package:flutter/material.dart';

class CustomTxtBtn extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  const CustomTxtBtn({
    Key? key,
    required this.btnText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 40, right: 40),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFF019DC1)),
        ),
        child: Text(
          btnText,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );
  }
}
