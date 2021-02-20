import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GalleryPage extends StatelessWidget {
  List<String> images = [
    'images/image1.jpeg',
    'images/image2.jpeg',
    'images/image3.jpeg',
    'images/image4.jpeg',
    'images/image5.jpeg',
    'images/image6.jpeg',
    'images/image7.jpeg',
    'images/image8.jpeg',
    'images/image9.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: images.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    )),
              ),
            );
          }),
    );
  }
}
