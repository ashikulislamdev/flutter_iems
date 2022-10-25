import 'package:flutter/material.dart';
import 'package:flutter_iems/widgets/text_fields/custom_text_field.dart';
import 'package:flutter_iems/widgets/custom_txt_brn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/logo.png'), fit: BoxFit.cover)),
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
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(hintText: "Email", textEditingController: emailController),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(hintText: "Password", textEditingController: passwordController),
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
                CustomTxtBtn(btnText: "SIGN IN", onPressed: (){}),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}