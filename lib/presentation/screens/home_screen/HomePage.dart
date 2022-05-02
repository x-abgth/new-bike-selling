import 'package:flutter/material.dart';
import 'package:ktm/presentation/screens/home_screen/widgets/HomePageMenuSection.dart';
import 'package:ktm/presentation/screens/home_screen/widgets/HomePageCarousel.dart';
import '../../../core/constants/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // home page app bar
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
      // home page main contents
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
