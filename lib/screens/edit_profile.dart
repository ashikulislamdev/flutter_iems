import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/widgets/common/custom_button.dart';
import 'package:flutter_iems/widgets/common/my_appbar.dart';
import 'package:flutter_iems/widgets/common/my_drawer.dart';
import 'package:flutter_iems/widgets/text_fields/edit_profile_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  TextEditingController nameController = TextEditingController(text: "Louis Chapman");
  TextEditingController emailController = TextEditingController(text: "louise@gmail.com");
  TextEditingController numberController = TextEditingController(text: "01674927239");
  TextEditingController statusController = TextEditingController(text: "Lorem Ipsum is simply dummy text of the printing and typesetting text is industry. Lorem Ipsum has");
  
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
        child: Column(
          children: [
            ReusableTextField(
              textEditingController: nameController, 
              title: "Full Name"
            ),
            SizedBox(height: kDefaultPadding),
            ReusableTextField(
              textEditingController: emailController, 
              title: "Email"
            ),
            SizedBox(height: kDefaultPadding),
            ReusableTextField(
              textEditingController: numberController, 
              title: "Phone Number"
            ),
            SizedBox(height: kDefaultPadding),
            ReusableTextField(
              textEditingController: statusController, 
              title: "Address",
              minLines: 4,
            ),
            SizedBox(height: kDefaultPadding * 4,),
            CustomButton(text: "Save", onTap: (){})
          ],
        ),
      ),
    );
  }
}