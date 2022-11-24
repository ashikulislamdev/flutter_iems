import 'package:flutter/material.dart';

import 'amount_box.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer(
      {Key? key, required this.totalExpense, required this.totalIncome})
      : super(key: key);
  final double totalExpense;
  final double totalIncome;
  @override
  Widget build(BuildContext context) {
    double saving = totalIncome - totalExpense;
    
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: height * 0.3,
      width: width * 0.9,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff3CADE6),
            Color(0xff9A7BF6),
            Color(0xffC273FB),
          ],
          stops: [0.01, 0.2, 0.4],
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Total Balance",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.0,
            ),
          ),
          Text(
            saving.toStringAsFixed(2),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AmountBox(
                    icon: Icons.arrow_downward_rounded,
                    iconColor: Colors.green,
                    title: 'Income',
                    amount: totalIncome.toStringAsFixed(2)),
                AmountBox(
                    icon: Icons.arrow_upward_rounded,
                    iconColor: Colors.red,
                    title: 'Expense',
                    amount: totalExpense.toStringAsFixed(2)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
