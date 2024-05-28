import 'package:app_neu_social/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmpassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildTextFormField(
                      controller: emailController,
                      hintText: "Email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "It can't be empty";
                        } else if (!value.contains("@")) {
                          return "Enter a valid email!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    buildTextFormField(
                      controller: phoneController,
                      hintText: "Phone",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "It can't be empty";
                        } else if (value.length < 10) {
                          return "Characters must be at least 10";
                        } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                          return "Number should start with 6, 7, 8, or 9";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    buildTextFormField(
                      controller: passController,
                      hintText: "Password",
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
                    ),
                    SizedBox(height: 15),
                    buildTextFormField(
                      controller: confirmpassController,
                      hintText: "Confirm Password",
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
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        if (_formKey.currentState!.validate()) {
                          await prefs.setString(
                              "email", emailController.text.trim());
                          await prefs.setString(
                              "pass", passController.text.trim());
                          await prefs.setString(
                              "phone", phoneController.text.trim());
                          await prefs.setString(
                              "confirmpass", confirmpassController.text.trim());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 108, 162, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?) validator,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 70,
          width: 300,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5))),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
