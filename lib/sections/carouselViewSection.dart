import 'package:flutter/material.dart';
import 'package:ktm/widgets/HomePageWidgets/HomePageCarousel.dart';

class CarouselViewSection extends StatelessWidget {
  @required
  final List images;

  CarouselViewSection({this.images});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: HomePageCarousel(
              duration: 0,
              height: 3,
              images: images,
              indi: false,
            ),
          ),
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
