import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/widgets/common/my_appbar.dart';
import 'package:flutter_iems/widgets/common/my_drawer.dart';
import 'package:flutter_iems/widgets/custom_button.dart';
import 'package:flutter_iems/widgets/home_page_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(kDefaultPadding - 4),
        child: Column(
          children: [
            ManagementCard(
              iconPath: "assets/icons/manage-income.png", 
              cardTitle: "Income", amount: "43703 Taka",
              onPressed: () {},
            ),
            const SizedBox(height: 4,),
            ManagementCard(
              iconPath: "assets/icons/manage-expense.png", 
              cardTitle: "Expenses", amount: "12880 Taka",
              onPressed: () {},
            ),
            const SizedBox(height: 4,),
            ManagementCard(
              iconPath: "assets/icons/cash.png", 
              cardTitle: "Cash", amount: "14400 Taka",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}