import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  // final Color backgroundColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              kSecondPrimaryColor.withOpacity(0.9),
              kPrimaryColor.withOpacity(0.9),
            ],
          ),
          border: Border.all(
            width: 2,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: kHeadingTextStyle.copyWith(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
