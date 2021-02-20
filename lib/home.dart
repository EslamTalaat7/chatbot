import 'package:chat_bot/AboutPage.dart';
import 'package:chat_bot/ChatPage.dart';
import 'package:chat_bot/GalleryPage.dart';
import 'package:chat_bot/ProfilePage.dart';
import 'package:chat_bot/SettingPage.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  int index = 0;
  List<Widget> widgets = [
    ChatPage(),
    AboutPage(),
    GalleryPage(),
    SettingPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          leading: Container(),
          title: Text("ChatBot"),
        ),
        //BottomNavigation
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (currentindex) {
              setState(() {
                index = currentindex;
                print(currentindex);
              });
            },
            items: [
              // ignore: deprecated_member_use
              BottomNavigationBarItem(
                  // ignore: deprecated_member_use
                  icon: Icon(Icons.chat_bubble),
                  // ignore: deprecated_member_use
                  title: Text("Home")),
              // ignore: deprecated_member_use
              BottomNavigationBarItem(
                  // ignore: deprecated_member_use
                  icon: Icon(Icons.info),
                  // ignore: deprecated_member_use
                  title: Text("About")),
              // ignore: deprecated_member_use
              BottomNavigationBarItem(
                  // ignore: deprecated_member_use
                  icon: Icon(Icons.image),
                  // ignore: deprecated_member_use
                  title: Text("Gallery")),
              // ignore: deprecated_member_use
              BottomNavigationBarItem(
                  // ignore: deprecated_member_use
                  icon: Icon(Icons.settings),
                  // ignore: deprecated_member_use
                  title: Text("Setting")),
              // ignore: deprecated_member_use
              BottomNavigationBarItem(
                  // ignore: deprecated_member_use
                  icon: Icon(Icons.person),
                  // ignore: deprecated_member_use
                  title: Text("Profile"))
            ]),
        body: widgets[index],
      ),
    );
  }
}
