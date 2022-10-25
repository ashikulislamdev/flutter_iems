import 'package:flutter/material.dart';

import 'package:flutter_iems/helpers/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 40, right: 40),
      child: TextFormField(
        controller: textEditingController,
        style: const TextStyle(fontSize: 16, color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: kDividerColor.withAlpha(0xFF616161)),
          filled: true,
          fillColor: const Color(0xff161d27).withOpacity(0.9),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kSecondPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kSecondPrimaryColor)),
        ),
      ),
    );
  }
}
