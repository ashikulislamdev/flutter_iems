import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';

class ReuseableTextField extends StatelessWidget {
  final String textHint;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int minLines; 
  const ReuseableTextField({
    Key? key,
    required this.textHint,
    required this.textEditingController,
    required this.textInputType,
    this.textInputAction = TextInputAction.next,
    this.minLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      style: kTitleTextstyle.copyWith(fontSize: 15),
      minLines: minLines,
      maxLines: 5,
      decoration: InputDecoration(
          hintText: textHint,
          hintStyle: kTitleTextstyle.copyWith(
              fontWeight: FontWeight.w400, fontSize: 15, color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kSecondPrimaryColor)),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red))),
    );
  }
}