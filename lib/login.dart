// ignore: unused_import
import 'dart:convert';

import 'package:chat_bot/SignUp.dart';
import 'package:chat_bot/home.dart';
import 'package:chat_bot/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: unused_import
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  String _userName, _password;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Center(
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.3,
                    child: Image.asset("images/chatbot.jpeg"),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Welcome To our ChatBot....",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
                child: TextFormField(
                  onSaved: (val) {
                    _userName = val;
                  },
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue)),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.supervised_user_circle,
                        color: Colors.blue,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(fontFamily: 'font')),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
                child: TextFormField(
                  onSaved: (password) {
                    _password = password;
                  },
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue)),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.blue,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(fontFamily: 'font')),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Builder(
                  builder: (context) => FlatButton(
                    onPressed: () async {
                      if (_globalKey.currentState.validate()) {
                        _globalKey.currentState.save();
                        print(
                            // ignore: unnecessary_brace_in_string_interps
                            "${_password}${_userName} kkkkkkkkkkkkkkkkkkkkkkkkkkk");
                        try {
                          final authResult =
                              await auth.sign_in_with_email_and_password(
                                  _userName.trim(), _password.trim());

                          // modelhud.isprogressloding(false);
                          //Navigator.pushNamed(context, waitngWidget.id);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => home()));
                          print(authResult.user.uid);
                        } on PlatformException catch (e) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                              e.message.toString(),
                              style: TextStyle(fontFamily: 'font'),
                            ),
                          ));
                        }
                      }
                    },
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Don't Have An Account?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontFamily: 'font',
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        color: Colors.black),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
