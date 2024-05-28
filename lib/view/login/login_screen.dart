import 'package:app_neu_social/view/register/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Mobile Number",
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => HomeScreen(),
              //     ));
            },
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 108, 162, 255),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
