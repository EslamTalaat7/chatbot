import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
  List<Color> colors = [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.yellow,
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Center(
            child: Text(
              "Select Your Mode....",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.56,
          child: GridView.builder(
              physics: new NeverScrollableScrollPhysics(),
              itemCount: colors.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colors[index]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text("Wallpaper"),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              Icon(
                Icons.wallpaper,
                color: Colors.blue,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Text("Notification"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Radio(value: false, groupValue: null, onChanged: (val) {}),
            Text("Mute"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Radio(value: false, groupValue: null, onChanged: (val) {}),
            Text("UnMute"),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Text("FontSize"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("14 Sp"),
                )),
          ]),
        ),
      ],
    );
  }
}
