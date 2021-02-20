// ignore: unused_import
import 'dart:convert';

import 'package:chat_bot/models/user.dart';
import 'package:chat_bot/services/auth.dart';
import 'package:chat_bot/services/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _firstName,
      _lastName,
      _email,
      _password,
      _address,
      _gender,
      hint = "Pick Your BirthDay..";
  // ignore: unused_field
  DateTime _birthDay;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  int _radioValue = 0;
  DateTime currentDate = DateTime.now();
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 1:
          _gender = "male";
          break;
        case 2:
          _gender = "female";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    Store store = Store();
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
                    width: width * 0.3,
                    height: height * 0.2,
                    child: Image.asset("images/chatbot.jpeg"),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
                child: TextFormField(
                  onSaved: (val) {
                    _firstName = val;
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
                      hintText: "Fist Name",
                      hintStyle: TextStyle(fontFamily: 'font')),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
                child: TextFormField(
                  onSaved: (val) {
                    _lastName = val;
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
                      hintText: "Last Name",
                      hintStyle: TextStyle(fontFamily: 'font')),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
                child: TextFormField(
                  onSaved: (val) {
                    _email = val;
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
                        Icons.mail,
                        color: Colors.blue,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(fontFamily: 'font')),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
                child: TextFormField(
                  onSaved: (val) {
                    _password = val;
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
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
                child: TextFormField(
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
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(fontFamily: 'font')),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
                child: TextFormField(
                  onSaved: (val) {
                    _address = val;
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
                        Icons.streetview_rounded,
                        color: Colors.blue,
                      ),
                      hintText: "Address",
                      hintStyle: TextStyle(fontFamily: 'font')),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
                child: TextField(
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
                        Icons.cake,
                        color: Colors.blue,
                      ),
                      hintText: hint,
                      hintStyle: TextStyle(fontFamily: 'font'),
                      suffixIcon: InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Icon(
                            Icons.date_range,
                            color: Colors.red,
                          ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Gender",
                      style: TextStyle(color: Colors.black),
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange),
                        Text(
                          "Male",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                            value: 2,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange),
                        Text(
                          "Female",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: Row(
                  children: <Widget>[
                    Checkbox(value: true, onChanged: (val) {}),
                    Text("Agree With Our Policy...")
                  ],
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
                        try {
                          final authResult =
                              await auth.sign_up_with_email_and_password(
                                  _email, _password);
                          store.adduser(User(_firstName, authResult.user.uid,
                              _lastName, _address, _gender, currentDate));
                          // Navigator.pushNamed(context, waitngWidget.id);
                          Navigator.pop(context);
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
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        hint = currentDate.toString();
      });
  }
}
