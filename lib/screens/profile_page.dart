import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/screens/edit_profile.dart';
import 'package:flutter_iems/widgets/common/my_appbar.dart';
import 'package:flutter_iems/widgets/common/my_drawer.dart';
import 'package:flutter_iems/widgets/icon_text_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? userId = '', userName = '', userPhone = '', userEmail = '', userPassword = '', userAddress = '', userProfile = '', userType = '', userRceiptId = '';
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }
  void getUserInfo() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userId = sharedPreferences.getString('currUserId')!;
      userName = sharedPreferences.getString('currUserName')!;
      userPhone = sharedPreferences.getString('currUserPhone')!;
      userEmail = sharedPreferences.getString('currUserEmail')!;
      userPassword = sharedPreferences.getString('currUserPassword')!;
      userAddress = sharedPreferences.getString('currUserAddress')!;
      userProfile = sharedPreferences.getString('currUserProfile')!;
      userType = sharedPreferences.getString('currUserType')!;
      userRceiptId = sharedPreferences.getString('currUserRceiptId')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage("$baseLink$userProfile"),
              ),
            ),
            Text(
              userName!,
              style: kHeadingTextStyle.copyWith(fontSize: 22),
            ),
            Text(
              userEmail!,
              style: kTitleTextstyle.copyWith(
                color: black.withOpacity(0.54),
              ),
            ),

            SizedBox(height: kDefaultPadding),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: IconTextBtn(text: "Edit", btnBg: kPrimaryColor, iconData: Icons.edit_outlined, 
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfile() ));
                }
              )
            ),
            SizedBox(height: kDefaultPadding),
            ProfileInfoCard(
              title: "Name",
              subTitle: userName!,
            ),
            ProfileInfoCard(
              title: "Eamil",
              subTitle: userEmail!,
            ),
            ProfileInfoCard(
              title: "Phone",
              subTitle: userPhone!,
            ),
            ProfileInfoCard(
              title: "Address",
              subTitle: userAddress!,
            ),
            
          ],
        ),
      ),
    );
  }
}



class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: kHeadingTextStyle.copyWith(fontSize: 14),
              ),
              SizedBox(height: kDefaultPadding / 3),
              Text(
                subTitle,
                style: kTitleTextstyle.copyWith(
                  color: black.withOpacity(0.54), fontSize: 13
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: kDividerColor,
          thickness: 2,
          height: 10,
        )
      ],
    );
  }
}
