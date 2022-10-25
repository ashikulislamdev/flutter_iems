import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/screens/edit_profile.dart';
import 'package:flutter_iems/widgets/common/my_appbar.dart';
import 'package:flutter_iems/widgets/common/my_drawer.dart';
import 'package:flutter_iems/widgets/icon_text_btn.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

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
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage("assets/images/profile_img.png"),
              ),
            ),
            Text(
              "Frances Garcia",
              style: kHeadingTextStyle.copyWith(fontSize: 22),
            ),
            Text(
              "Graphic Designer",
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
            const ProfileInfoCard(
              title: "Name",
              subTitle: "Frances Garcia",
            ),
            const ProfileInfoCard(
              title: "Eamil",
              subTitle: "frances@gmail.com",
            ),
            const ProfileInfoCard(
              title: "Phone",
              subTitle: "01722832823",
            ),
            const ProfileInfoCard(
              title: "Address",
              subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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
