import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/widgets/common/my_appbar.dart';
import 'package:flutter_iems/widgets/common/my_drawer.dart';
import 'package:flutter_iems/widgets/text_fields/reuseable_text_field.dart';
import 'package:intl/intl.dart';

import '../widgets/common/custom_button.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> with SingleTickerProviderStateMixin {
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
                    child: Text("Incomes", style: kTitleTextstyle.copyWith(fontSize: 15),),
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
                  Incomes(),

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

class AddCategories extends StatefulWidget {
  const AddCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {

  TextEditingController categoryController = TextEditingController();
  bool isChecked = false;

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
        Column(
          children: [
            Text("All categories", style: kHeadingTextStyle,),
            SizedBox(height: kDefaultPadding),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Text("Categories$index");
              },
            ),
          ],
        ),
        
      ],
    );
  }
}

class Incomes extends StatefulWidget {
  const Incomes({super.key});

  @override
  State<Incomes> createState() => _IncomesState();
}

class _IncomesState extends State<Incomes> {
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
          textHint: "Income Amount", 
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
          decoration: InputDecoration(
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
          textHint: "Description", 
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
            Text("Last Incomes", style: kHeadingTextStyle,),
            SizedBox(height: kDefaultPadding),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text("1200"),
                      subtitle: Text("This is the description of this income"),
                      leading: Text("14-10-22"),
                      //minLeadingWidth: dSize.width / 6,
                      trailing: IconButton(
                        
                        onPressed: (){}, 
                        icon: Icon(Icons.navigate_next, color: black,),
                      ),
                    ),
                   Divider(color: kDividerColor, endIndent: 16, indent: 4,),
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
