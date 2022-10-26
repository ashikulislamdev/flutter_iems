import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/widgets/common/my_appbar.dart';
import 'package:flutter_iems/widgets/common/my_drawer.dart';
import 'package:flutter_iems/widgets/manage_page_card.dart';

class ManageIncome extends StatelessWidget {
  const ManageIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      body: ListView.builder(
        padding: EdgeInsets.all(kDefaultPadding - 4),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ManagePageCard(
                description: "This is the description or not of this income $index", 
                ieDate: "23/07/22", amount: "220", onPressed: (){

                }
              ),
              const SizedBox(height: 5,)
            ],
          );
        },
      ),
    );
  }
}
