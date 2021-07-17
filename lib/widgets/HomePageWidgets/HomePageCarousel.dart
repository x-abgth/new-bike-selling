import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ktm/sections/carouselViewSection.dart';

class HomePageCarousel extends StatelessWidget {
  @required
  final double height;
  @required
  final List images;
  @required
  final int duration;
  @required
  final bool onTap;
  @required
  final bool indi;
  HomePageCarousel(
      {@required this.height,
      @required this.images,
      this.duration = 0,
      this.onTap = false,
      this.indi = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(0.0),
      height: MediaQuery.of(context).size.height / height,
      child: Carousel(
        boxFit: BoxFit.cover,
        showIndicator: indi,
        images: images,
        dotBgColor:
            duration <= 0 ? Colors.black.withOpacity(0.3) : Colors.transparent,
        indicatorBgPadding: 8.5,
        autoplay: duration <= 0 ? false : true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: duration),
        onImageTap: onTap
            ? (i) {
                print(i);
                return Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CarouselViewSection(
                              images: images,
                            )));
              }
            : (i) {},
      ),
    );
  }
}
