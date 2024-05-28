import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/Navigation/nav_screen.dart';
import 'package:app_neu_social/view/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage("assets/images/splash.jpeg"),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            width: 300,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Email",
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 300,
            child: TextField(
              obscureText: true,
              controller: passController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              final String RegEmail = prefs.getString("email").toString();
              final String RegPass = prefs.getString("pass").toString();
              if (emailController.text.trim() == RegEmail &&
                  passController.text.trim() == RegPass) {
                await prefs.setBool("IsLogged", true);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationScreen(),
                    ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("Enter a valid email and password"),
                  ),
                );
              }
            },
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: ColorConstant.DefaultBlue,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: ColorConstant.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't you have account ?"),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.indigo),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
