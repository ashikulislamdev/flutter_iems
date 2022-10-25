import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';

class IconTextBtn extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onTap;
  final Color btnBg;
  const IconTextBtn({
    Key? key,
    required this.text,
    required this.iconData,
    required this.onTap,
    required this.btnBg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding - 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: btnBg,
          border: Border.all(
            width: 2,
            color: kPrimaryColor,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, color: black,),
              SizedBox(width: kDefaultPadding,),
              Text(
                text,
                style: kHeadingTextStyle.copyWith(
                  fontSize: 15,
                  color: black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
