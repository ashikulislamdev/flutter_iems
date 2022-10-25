import 'package:flutter/material.dart';

import 'package:flutter_iems/helpers/constants.dart';

class ReusableTextField extends StatefulWidget {
  final String? title;
  final TextEditingController textEditingController;
  final bool isPassword;
  final int minLines;
  const ReusableTextField({
    Key? key,
    required this.title,
    required this.textEditingController,
    this.isPassword = false,
    this.minLines = 1,
  }) : super(key: key);

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  bool isObsecre = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title!,
          style: kTitleTextstyle.copyWith(
            color: black.withOpacity(0.54),
          ),
        ),
        SizedBox(height: kDefaultPadding / 2),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            maxLines: 5,
            minLines: widget.minLines,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: kTitleTextstyle,
              suffixIcon: widget.isPassword ? IconButton(
                color: isObsecre ? Colors.grey : kSecondPrimaryColor,
                icon: Icon(isObsecre ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isObsecre = !isObsecre;
                  });
                },
              ) : null,
            ),
          ),
        )
      ],
    );
  }
}
