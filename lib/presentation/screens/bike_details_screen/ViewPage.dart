import 'package:flutter/material.dart';
import 'package:ktm/core/constants/constants.dart';
import '../../../core/global/BookingUrlFunc.dart';
import 'package:ktm/presentation/screens/home_screen/widgets/HomePageCarousel.dart';

class ViewPage extends StatefulWidget {
  final dynamic index;
  final dynamic snapshot;
  ViewPage({this.index, this.snapshot});

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  List<String> colorNames = [];

  @override
  Widget build(BuildContext context) {
    List bikeImgs = [
      NetworkImage("$bikesImgUrl${widget.snapshot['m_image_a']}"),
      NetworkImage("$bikesImgUrl${widget.snapshot['m_image_b']}"),
      NetworkImage("$bikesImgUrl${widget.snapshot['m_image_c']}")
    ];

    trimColors() {
      colorNames = widget.snapshot['m_color'].split(",");
    }

    Size size = MediaQuery.of(context).size;
    trimColors();
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryDark,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: size.height / 2.5,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: "$bikesImgUrl${widget.snapshot['m_image_a']}",
                  child: HomePageCarousel(
                    duration: 0,
                    height: 2.5,
                    images: bikeImgs,
                    onTap: true,
                  ),
                ),
              ),
            ),
            buildDetails(),
          ],
        ),
        bottomNavigationBar: buildBottomNav(size, context),
      ),
    );
  }

  ConstrainedBox buildBottomNav(Size size, BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: size.width),
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            backgroundColor: kPrimary,
            primary: Colors.white,
          ),
          child: Text(
            "BOOK NOW",
            style: TextStyle(fontSize: 20, letterSpacing: 1.5),
          ),
          onPressed: () => browser(),
        ),
      ),
    );
  }

  Widget buildDetails() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(15),
        color: kPrimaryDark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.snapshot['m_name'],
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: kPrimary),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: buildText(
                color: Colors.white60,
                tSize: 15,
                text: "₹${widget.snapshot['m_price']}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText(
                        text: "Category ",
                        weight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: buildText(
                          text: widget.snapshot['m_category'],
                          tSize: 15,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.grey[800],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      buildText(
                        text: "Colours ",
                        weight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < colorNames.length; i++)
                              colorCircles(colorName: colorNames[i]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            Row(
              children: [
                buildText(
                  text: "Mileage ",
                  weight: FontWeight.bold,
                ),
                Spacer(),
                buildText(
                  text: widget.snapshot['m_mileage'],
                  tSize: 15,
                  color: Colors.white60,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                buildText(
                  text: "Displacement ",
                  weight: FontWeight.bold,
                ),
                Spacer(),
                buildText(
                  text: widget.snapshot['m_displacement'],
                  tSize: 15,
                  color: Colors.white60,
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  text: "Engine ",
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: buildText(
                        text: widget.snapshot['m_engine'],
                        tSize: 15,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                buildText(
                  text: "Cylinders ",
                  weight: FontWeight.bold,
                ),
                Spacer(),
                buildText(
                  text: widget.snapshot['m_cylinders'],
                  tSize: 15,
                  color: Colors.white60,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                buildText(
                  text: "Power ",
                  weight: FontWeight.bold,
                ),
                Spacer(),
                buildText(
                  text: widget.snapshot['m_power'],
                  tSize: 15,
                  color: Colors.white60,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                buildText(
                  text: "Torque ",
                  weight: FontWeight.bold,
                ),
                Spacer(),
                buildText(
                  text: widget.snapshot['m_torque'],
                  tSize: 15,
                  color: Colors.white60,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                buildText(
                  text: "Fuel Capacity ",
                  weight: FontWeight.bold,
                ),
                Spacer(),
                buildText(
                  text: widget.snapshot['m_fuel_tank'],
                  tSize: 15,
                  color: Colors.white60,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                buildText(
                  text: "ABS ",
                  weight: FontWeight.bold,
                ),
                Spacer(),
                buildText(
                  text: widget.snapshot['m_abs'],
                  tSize: 15,
                  color: Colors.white60,
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  text: "Features ",
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                buildText(
                  text: widget.snapshot['m_key_features'],
                  tSize: 15,
                  color: Colors.white60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget colorCircles({String colorName}) {
    if (colorName == "Orange") {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange ?? Colors.transparent,
        ),
      );
    } else if (colorName == "White") {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white ?? Colors.transparent,
        ),
      );
    } else if (colorName == "Black") {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black ?? Colors.transparent,
        ),
      );
    } else if (colorName == "Silver") {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey ?? Colors.transparent,
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Text buildText(
      {Color color = Colors.white,
      dynamic text,
      double tSize = 17,
      FontWeight weight = FontWeight.normal}) {
    return Text(
      text,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        height: 1.3,
        fontSize: tSize,
        fontFamily: 'Roboto',
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
