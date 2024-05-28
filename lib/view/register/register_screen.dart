import 'package:app_neu_social/view/login/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Phone",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => OtpScreen(),
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
                    "Register",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?"),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.indigo),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
