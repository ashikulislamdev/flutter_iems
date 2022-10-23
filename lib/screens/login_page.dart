import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/screens/home_screen.dart';
import 'package:flutter_iems/widgets/custom_txt_brn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isVisible = false;

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
                      child: TextField(
                        controller: emailControler,
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
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: TextField(
                        controller: passwordControler,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
              
            ],
          ),
        ),
      ),
    );
  }
}
