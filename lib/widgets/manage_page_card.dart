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
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white
      ),
      child: ListTile(
        leading: Column(
          children: [
            const ImageIcon(AssetImage("assets/icons/cash.png"), color: kSecondPrimaryColor,),
            Text(amount, style: kTitleTextstyle.copyWith(color: const Color(0xFF6C6C6C), fontSize: 15, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),),
          ],
        ),
        title: Text(ieDate),
        subtitle: Text(description, style: kTitleTextstyle,),
        trailing: IconButton(
          hoverColor: kActiveStatus,
          onPressed: onPressed, icon: const Icon(Icons.navigate_next)
        ),
      )
    );
  }
}
