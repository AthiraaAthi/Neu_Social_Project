import 'package:app_neu_social/model/user.dart';
import 'package:app_neu_social/providers/user_provider.dart';
import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/Navigation/nav_screen.dart';
import 'package:app_neu_social/view/event_screen/event_details_screen/event_details_screen.dart';
import 'package:app_neu_social/view/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogged = prefs.getBool("isLogged") ?? false;

    if (isLogged) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NavigationScreen()),
      );
    }
  }

  Future<bool> _validateLogin(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username');
    final storedPassword = prefs.getString('password');

    // await prefs.setBool("isLogged", true);
    return storedUsername == username && storedPassword == password;
  }

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (await _validateLogin(emailController.text, passController.text)) {
        final user =
            User(username: emailController.text, password: passController.text);
        Provider.of<UserProvider>(context, listen: false).login(user);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool("isLogged", true);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NavigationScreen()),
        );
      } else {
        // Show an error message if login fails
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
          content: Text('Invalid email or password'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/images/splash.jpeg"))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "It can't be empty";
                        } else if (!value.contains("@")) {
                          return "Enter a valid email!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        emailController.text = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "It can't be empty";
                        } else if (value.length <= 6) {
                          return "Characters should be greater than 6";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        passController.text = value!;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: () => _login(context),
                  //   child: Text('Login'),
                  // ),
                  InkWell(
                    onTap: () => _login(context),
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
                              color: ColorConstant.white,
                              fontWeight: FontWeight.bold),
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
                      Text(
                        "Don't you have account ?",
                        style: GoogleFonts.josefinSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
