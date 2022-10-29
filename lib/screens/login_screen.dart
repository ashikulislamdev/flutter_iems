import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/screens/home_screen.dart';
import 'package:flutter_iems/widgets/text_fields/custom_text_field.dart';
import 'package:flutter_iems/widgets/custom_txt_brn.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void loginApi(String email, password) async{
      http.Response response = await http.post(
        // http://localhost/project/income-expense/login_api_post http://iems.callnsolution.com.bd/login_api_post

        Uri.parse("http://localhost/project/income-expense/login_api_post", ),
        body: {
          email : email,
          password : password
        },
      );
      if (response.statusCode == 200) {
        // var data = jsonDecode(response.body.toString());
        // print(data);
        print("api is okey");
      }else{
        print("Sorry, something wrong");
      }
  }

  Future<void> newLogin() async{
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(
        Uri.parse("https://reqres.in/api/login/"),
        body: ({
          'email' : emailController.text,
          'password' : passwordController.text
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(jsonDecode(response.body.toString()));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen() ));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid cradential")));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Required email and password!")));

    }
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/joma-khoros-transfarent.png'), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.transparent,
              const Color(0xff161d27).withOpacity(0.9),
              const Color(0xff161d27),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Welcome!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Time to accounting, let's Sign in",
                    style: kTitleTextstyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(hintText: "Email", textEditingController: emailController, isEmail: true, isPassword: false,),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(hintText: "Password", textEditingController: passwordController, isPassword: true,),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  // const Text(
                  //   "Forgot Password?",
                  //   style: TextStyle(
                  //       color: Color(0xFF019DC1), fontSize: 14, fontWeight: FontWeight.bold),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTxtBtn(
                    btnText: "SIGN IN", 
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        //loginApi(emailController.text.toString(), passwordController.text.toString());
                        newLogin();
                      }
                    }
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}