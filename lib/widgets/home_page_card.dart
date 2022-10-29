import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';

class ManagementCard extends StatelessWidget {
  final String iconPath;
  final String cardTitle;
  final String amount;
  final Function()? onPressed;
  const ManagementCard({
    Key? key,
    required this.iconPath,
    required this.cardTitle,
    required this.amount, 
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kDefaultPadding),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageIcon(AssetImage(iconPath), size: 35, color: white,),
              Text(cardTitle, style: kHeaderTextstyle.copyWith(color: white),),
            ],
          ),
          SizedBox(height: kDefaultPadding - 6,),
          Text(amount, style: kTitleTextstyle.copyWith(color: white, fontSize: 22),),
          SizedBox(height: kDefaultPadding - 6,),
          ElevatedButton(
            onPressed: onPressed, 
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding - 8, horizontal: kDefaultPadding * 3),
              backgroundColor: white,
            ),
            child: Text("View All", style: kTitleTextstyle.copyWith(color: kPrimaryColor, fontSize: 16),),
          )
        ],
      ),
    );
  }
}
