import 'package:chat_bot/services/delete.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email, password;
  // final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.06),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "images/profile.jpg",
                  )),
            ),
          ),
          Center(
            child: Text(
              "Eslam Talat",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              "Egypt,Cairo",
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              "images/profile.jpg",
                            )),
                      ),
                      SizedBox(
                        width: width * 0.09,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.blue),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Upload Photo",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "For best result use an image at least 256 px by 256 px in either .jpg or .png format",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("First Name *"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 0.06,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Eslam",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    fillColor: Colors.grey.withOpacity(0.4),
                    filled: true),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("Last Name *"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 0.06,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Talat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    fillColor: Colors.grey.withOpacity(0.4),
                    filled: true),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("Email *"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 0.06,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Eslam123@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    fillColor: Colors.grey.withOpacity(0.4),
                    filled: true),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("Password *"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 0.06,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "*************",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    fillColor: Colors.grey.withOpacity(0.4),
                    filled: true),
              ),
            ),
          ),
          // Center(
          //   child: Text(
          //     "Delete Account",
          //     style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120.0),
            child: FlatButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () async {
                  // await AuthService().deleteUser(email, password);
                  FirebaseUser user = await FirebaseAuth.instance.currentUser();
                  user.delete();
                },
                child: Center(
                  child: Text(
                    "Delete Account",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120.0),
            child: FlatButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {},
                child: Center(
                  child: Text(
                    "Apply",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120.0),
              child: FlatButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Navigator.of(context)
                      .pop(MaterialPageRoute(builder: (context) => login()));
                },
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "Logout         ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
