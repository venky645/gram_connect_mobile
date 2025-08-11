// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formkey = GlobalKey<FormFieldState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _pwdTextEditingController =
      TextEditingController();
  final TextEditingController _cpwdTextEditingController =
      TextEditingController();
  var _obscureText1 = true;
  var _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade800, Colors.purpleAccent.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Join Us',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailTextEditingController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          hintText: "Email",
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        controller: _pwdTextEditingController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key_outlined,

                            color: Colors.black.withOpacity(0.3),
                          ),
                          hintText: "Password",
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText1 = !_obscureText1;
                              });
                            },
                            //icon: Icon(Icons.visibility_outlined),
                            icon: _obscureText1
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off_outlined),

                            color: Colors.black.withOpacity(0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        controller: _cpwdTextEditingController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Confirm Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key_outlined,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          hintText: "Confirm Password",
                          labelText: "Confirm Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
                              });
                            },
                            //icon: Icon(Icons.visibility_outlined),
                            icon: _obscureText2
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off_outlined),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(onPressed: () {}, child: Text("Signup")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
