import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: width * 0.1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          color: Colors.blue),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Welcome To Our ChatBot ....",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                        width: width * 0.1,
                        height: height * 0.05,
                        child: Image.asset(
                          "images/chatbot.jpeg",
                        )),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      "sent at 10:pm",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: width * 0.1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          color: Colors.blue),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ASk About.....?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                        width: width * 0.1,
                        height: height * 0.05,
                        child: Image.asset(
                          "images/chatbot.jpeg",
                        )),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      "sent at 10:pm",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
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
                    hintText: "Type Something....",
                    hintStyle: TextStyle(fontFamily: 'font'),
                    suffixIcon: Icon(Icons.send)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
