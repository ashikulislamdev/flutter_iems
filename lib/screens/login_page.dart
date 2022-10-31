import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/screens/home_screen.dart';
import 'package:flutter_iems/widgets/custom_txt_brn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isVisible = false;


  @override
  void initState() {
    checkLogin();
    super.initState();
  }
  
  void pageRoute(String userId, userName, userPhone, userEmail, userPassword, userAddress, userProfile, userType, userRceiptId)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('currUserId', userId);
    await preferences.setString('currUserName', userName);
    await preferences.setString('currUserPhone', userPhone);
    await preferences.setString('currUserEmail', userEmail);
    await preferences.setString('currUserPassword', userPassword);
    await preferences.setString('currUserAddress', userAddress);
    await preferences.setString('currUserProfile', userProfile);
    await preferences.setString('currUserType', userType);
    await preferences.setString('currUserRceiptId', userRceiptId);
  
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
      
  }
  //Check login
  void checkLogin() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userEmail = sharedPreferences.getString('currUserEmail');
    if (userEmail != null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
      
    }
  }

  Future<void> newLogin() async{
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // dismiss keyboard during async call
      //FocusScope.of(context).requestFocus(FocusNode());

      var myBody = jsonEncode({
        'email': emailController.text,
        'password': passwordController.text,
      });
      // print(my_body);

      http.Response response = await http.post(
        Uri.parse("${baseLink}login_api_post"),
        body: myBody,        
      );
      
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res =  response.body;
        Map<String, dynamic> data = jsonDecode(res);

        if(data['status'] == true){
          //
          var returnMsg = data['massage']!, userId = data['userId']!, userName = data['username']!, userPhone = data['phone_no']!, userEmail = data['email']!, userPassword = data['password']!, userAddress = data['address']!, userProfile = data['userprofile']!, userType = data['user_type']!, userRceiptId = data['receipt_id']!;
          
          //print("User Info $userId,$userName,$userPhone,$userEmail,$userPassword,$userAddress,$userProfile,$userType,$userRceiptId");

          //return successfull msg
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("$returnMsg")));

          //Here we save user info to the shared_preferences 
          pageRoute(userId, userName, userPhone, userEmail, userPassword, userAddress, userProfile, userType, userRceiptId);

        }else{
          //return unsuccessful msg
          var msg = data['massage'];
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("$msg")));
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something is wrong!")));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email and password required!")));
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              SizedBox(height: kDefaultPadding * 3),
              Image.asset(
                "assets/images/joma-khoros-transfarent.png",
                height: 100,
              ),
              SizedBox(height: kDefaultPadding),
              Text(
                "Hello, \nPlease Sign in",
                style: kHeadingTextStyle,
              ),
              SizedBox(height: kDefaultPadding * 3),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: ImageIcon(
                            const AssetImage("assets/icons/message_icon.png"),
                            color: kSecondPrimaryColor.withOpacity(0.5),
                          ),
                          //filled: true,
                          fillColor: Colors.white,
                          hintStyle: kTitleTextstyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: kSecondPrimaryColor.withOpacity(0.4)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kSecondPrimaryColor.withAlpha(0xFFF44336),
                            ),
                          ),
                          hintText: "Enter your email",
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: !_isVisible,
                        decoration: InputDecoration(
                          prefixIcon: ImageIcon(
                            const AssetImage("assets/icons/lock_icon.png"),
                            color: kSecondPrimaryColor.withOpacity(0.5),
                          ),
                          hintStyle: kTitleTextstyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: kSecondPrimaryColor.withOpacity(0.4)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kSecondPrimaryColor.withAlpha(0xFFF44336),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: _isVisible
                                ? const Icon(
                                    Icons.visibility,
                                    color: kSecondPrimaryColor,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                          ),
                          hintText: "Enter your password",
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding * 2),
              CustomTxtBtn(
                  btnText: "SIGN IN",
                  onPressed: () {
                    newLogin();
                  }),
              
            ],
          ),
        ),
      ),
    );
  }
}
