
import 'package:flutter/material.dart';

import 'package:flutter_iems/helpers/constants.dart';

class ManagePageCard extends StatelessWidget {
  final String ieDate, amount, description;
  final Function()? onPressed;
  const ManagePageCard({
    Key? key,
    required this.description,
    required this.ieDate, 
    required this.amount,
    required this.onPressed, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: white
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(ieDate, style: kTitleTextstyle.copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 16)),
              Text("$amount ৳", style: kTitleTextstyle.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFFF44336), fontSize: 16),),
            ],
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: dSize.width / 1.6, child: Text(description, style: kTitleTextstyle.copyWith(fontSize: 13),)),
              ElevatedButton(onPressed: onPressed, child: const Text("Details"),)
            ],
          )
        ],
      )
    );
  }
}
