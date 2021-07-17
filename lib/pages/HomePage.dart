import 'package:flutter/material.dart';
import 'package:ktm/sections/HomePageMenuSection.dart';
import 'package:ktm/widgets/HomePageWidgets/HomePageCarousel.dart';
import '../utils/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        elevation: 0,
        title: SizedBox(
          height: 130,
          width: 130,
          child: Image.asset(
            ktmBlackLogo,
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              HomePageCarousel(
                height: 3.5,
                images: carouselList,
                duration: 2000,
              ),
              HomePageMenuSection(),
            ],
          ),
        ),
      ),
    );
  }
}
