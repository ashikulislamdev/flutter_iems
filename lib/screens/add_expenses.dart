import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/widgets/common/my_appbar.dart';
import 'package:flutter_iems/widgets/common/my_drawer.dart';
import 'package:flutter_iems/widgets/manage_page_card.dart';
import 'package:flutter_iems/widgets/text_fields/reuseable_text_field.dart';
import 'package:intl/intl.dart';

import '../widgets/common/custom_button.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key});

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        child: Column(
          children: [
            //Slider

            Container(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TabBar(
                unselectedLabelStyle: kTitleTextstyle.copyWith(
                    color: black.withOpacity(0.44),
                    fontWeight: FontWeight.w400),
                labelStyle: kTitleTextstyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w700),
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.blue,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    child: Text("Expenses", style: kTitleTextstyle.copyWith(fontSize: 15),),
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    child: Text("Add Category", style: kTitleTextstyle.copyWith(fontSize: 15),),
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const[
                  // first tab bar
                  Expenses(),

                  // second tab bar
                  AddCategories(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<String> listOfCategories = [
    'Entertainment',
    'For Family',
    'Brackfast',
    'Cloths',
    'Rent',
    'Others'
  ];
  String? categoriesValue;

  
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: kDefaultPadding),

        //Add Event Title
        ReuseableTextField(
          textHint: "Expenses Amount", 
          textEditingController: amountController, 
          textInputType: TextInputType.number,
        ),
        SizedBox(height: kDefaultPadding / 2),

        //Event Price
        DropdownButtonFormField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: black.withAlpha(0xFFF44336)),
            ),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kSecondPrimaryColor )),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: black.withAlpha(0xFFF44336))),
          ),
          value: categoriesValue,
          hint: Text(
            'Select category',
            style: kTitleTextstyle.copyWith(fontSize: 15)
          ),
          onChanged: (value) {
            setState(() {
              categoriesValue = value;
              //print(categoriesValue);
            });
          },
          onSaved: (value) {
            setState(() {
              categoriesValue = value;
            });
          },
          validator: (String? value) {
            if (value!.isEmpty) {
              return "can't empty";
            } else {
              return null;
            }
          },
          items: listOfCategories.map((String val) {
            return DropdownMenuItem(
              value: val,
              child: Text(val),
            );
          }).toList(),
        ),
        SizedBox(height: kDefaultPadding / 2),

        //Add Time and Date
        TextFormField(
          readOnly: true,
          controller: dateController,
          decoration: const InputDecoration(
            labelText: 'Date',
          ),
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2015),
              lastDate: DateTime(2025),
            ).then((selectedDate) {
              if (selectedDate != null) {
                dateController.text =
                    DateFormat('yyyy-MM-dd').format(selectedDate);
              }
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter date.';
            }
            return null;
          },
        ),
        SizedBox(height: kDefaultPadding / 2),

        //Add Description
        ReuseableTextField(
          textHint: "Description/Note", 
          textEditingController: descController, 
          textInputType: TextInputType.text,
          minLines: 3,
        ),
        SizedBox(height: kDefaultPadding),
        CustomButton(
          text: "Submit",
          onTap: () {},
        ),

        SizedBox(height: kDefaultPadding * 2),
        Divider(color: black, endIndent: 8, indent: 8,),
        Column(
          children: [
            Text("Last Expenses", style: kHeadingTextStyle,),
            SizedBox(height: kDefaultPadding),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ManagePageCard(
                      description: "This is the description of this expenses $index", 
                      ieDate: "14-10-22", amount: "1700", onPressed: (){}
                    ),
                    
                    const Divider(color: kDividerColor, endIndent: 16, indent: 4,),
                  ],
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}


class AddCategories extends StatefulWidget {
  const AddCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {

  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: kDefaultPadding),

        //Add Event Title
        ReuseableTextField(
          textHint: "Add new category", 
          textEditingController: categoryController, 
          textInputType: TextInputType.text
        ),

        SizedBox(height: kDefaultPadding),
        CustomButton(
          text: "Submit",
          onTap: () {},
        ),

        SizedBox(height: kDefaultPadding * 2),

        Text("All expenses categories", style: kHeadingTextStyle.copyWith(fontSize: 26),),
        SizedBox(height: kDefaultPadding),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kDefaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                  ),
                  child: Text(
                    "This is Category $index",
                    style: kTitleTextstyle.copyWith(
                      color: black.withOpacity(0.86),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Divider(color: kDividerColor, endIndent: 16, indent: 4,),
              ],
            );
          },
        ),
        
      ],
    );
  }
}