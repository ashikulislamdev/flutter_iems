import 'package:flutter/material.dart';

import 'package:flutter_iems/helpers/constants.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool isEmail; 
  final bool isPassword; 
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.isEmail = false,
    this.isPassword = true,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isVisible = true;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 40, right: 40),
      child: TextFormField(
        validator: widget.isEmail ? (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Email";
          }
          else if (!value.contains('@') || !value.contains('.')) {
            return "Please Enter valid email";
          } else {
            return null;
          }
        } :(value) {
          if (value == null || value.isEmpty) {
            return "Please Enter password";
          }
          return null;
        },
        controller: widget.textEditingController,
        style: const TextStyle(fontSize: 16, color: Colors.white),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: kDividerColor.withAlpha(0xFF616161)),
          filled: true,
          fillColor: const Color(0xff161d27).withOpacity(0.9),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kSecondPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kSecondPrimaryColor)),
          suffixIcon: widget.isPassword ? IconButton(
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            icon: !_isVisible
                ? const Icon(
                    Icons.visibility,
                    color: kSecondPrimaryColor,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
          ) : null,
        ),
        obscureText: widget.isPassword ? _isVisible : false,
      ),
    );
  }
}
