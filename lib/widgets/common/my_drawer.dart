import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/screens/add_income.dart';
import 'package:flutter_iems/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../general_card.dart';
import '../info_card.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: dSize.width / 1.4,
      child: ListView(
        children: [
          SizedBox(height: kDefaultPadding,),
          //Profile
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              children: [
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: 42.r,
                    backgroundColor: kSecondPrimaryColor,
                    child: CircleAvatar(
                      radius: 40.r,
                      backgroundImage: const AssetImage('assets/images/profile_img.png'),
                    ),
                  ),
                ),
                SizedBox(width: kDefaultPadding / 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "White Devil",
                        style: kHeadingTextStyle.copyWith(fontSize: 20),
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Text(
                        "devil@gmail.com",
                        style: kTitleTextstyle.copyWith(
                            color: black.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
      
          //GENERAl
          SizedBox(height: kDefaultPadding),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            child: Text(
              "MANAGEMENT",
              style: kTitleTextstyle.copyWith(
                color: black.withOpacity(0.38),
                fontSize: 15.sp,
              ),
            ),
          ),
          buildDiv(),
          GeneralCard(
            image: "assets/icons/dashboard-icon.png",
            title: "Dashboard",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          buildDiv(),
          GeneralCard(
            image: "assets/icons/add-income.png",
            title: "Add Income",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddIncome()));
            },
          ),
          buildDiv(),
          GeneralCard(
            image: "assets/icons/manage-income.png",
            title: "Manage Income",
            onTap: () { },
          ),
          buildDiv(),
          GeneralCard(
            image: "assets/icons/add-expenses.png",
            title: "Add Expenses",
            onTap: () { },
          ),
          buildDiv(),
          GeneralCard(
            image: "assets/icons/manage-expense.png",
            title: "Manage Expenses",
            onTap: () {},
          ),
          buildDiv(),
      
          //Information
          SizedBox(height: kDefaultPadding),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            child: Text(
              "INFORMATIONS",
              style: kTitleTextstyle.copyWith(
                color: black.withOpacity(0.38),
                fontSize: 15.sp,
              ),
            ),
          ),
          buildDiv(),
          const InfoCard(title: "Profile"),
          buildDiv(),
          const InfoCard(title: "Logout"),
          buildDiv(),
      
          SizedBox(height: kDefaultPadding),
          ListTile(
            onTap: () { },
            trailing: const ImageIcon(
              AssetImage("assets/icons/about-us.png"),
              color: Colors.black,
            ),
            title: Text(
              "About Us",
              style: kTitleTextstyle.copyWith(
                color: black.withOpacity(0.84),
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }

  Divider buildDiv() {
    return Divider(
      height: 5.h,
      color: kDividerColor,
      thickness: 2.sp,
    );
  }
}

