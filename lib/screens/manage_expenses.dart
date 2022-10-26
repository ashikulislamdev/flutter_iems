import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/widgets/common/my_appbar.dart';
import 'package:flutter_iems/widgets/common/my_drawer.dart';
import 'package:flutter_iems/widgets/manage_page_card.dart';

class ManageExpenses extends StatelessWidget {
  const ManageExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: kDefaultPadding- 6,),
            Text("Manage your daily expenses", style: kHeadingTextStyle.copyWith(fontSize: 18),),
            SizedBox(height: kDefaultPadding- 6,),
            ListView.builder(
              padding: EdgeInsets.all(kDefaultPadding - 4),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ManagePageCard(
                      description: "This is the description or not of this income $index", 
                      ieDate: "23/07/22", amount: "32340", onPressed: (){
      
                      }
                    ),
                    const SizedBox(height: 5,)
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}