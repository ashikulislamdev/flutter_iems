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

 // http://localhost/project/income-expense/login_api_post 
 // http://iems.callnsolution.com.bd/login_api_post  email:rsgroup150@gmail.com, password:rsdev
 // https://reqres.in/api/login/  email:eve.holt@reqres.in, password:cityslicka

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
          var msg = data['massage'];
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("$msg")));
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen() ));
        }else{
          var msg = data['massage'];
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("$msg")));
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something is wrong!")));
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
                  CustomTextField(hintText: "Email", textEditingController: emailController, isEmail: true, isPassword: false, textInputAction: TextInputAction.next, textInputType: TextInputType.emailAddress,),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(hintText: "Password", textEditingController: passwordController, isPassword: true, textInputAction: TextInputAction.done,),
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