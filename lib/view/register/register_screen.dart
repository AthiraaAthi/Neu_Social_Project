import 'package:app_neu_social/providers/user_provider.dart';
import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_neu_social/model/user.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  void _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final user = User(
        username: emailController.text,
        password: passController.text,
      );
      await _saveUserToPreferences(user);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  Future<void> _saveUserToPreferences(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', user.username);
    await prefs.setString('password', user.password);
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
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'Email',
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
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      controller: passController,
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
                  Container(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      controller: confirmPassController,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "It can't be empty";
                        } else if (value != passController.text) {
                          return "Passwords should be the same";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        confirmPassController.text = value!;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => _register(context),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: ColorConstant.DefaultBlue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: ColorConstant.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.indigo),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
