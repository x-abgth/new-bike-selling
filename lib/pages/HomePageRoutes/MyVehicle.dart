import 'package:flutter/material.dart';
import 'package:ktm/utils/constants.dart';

class MyVehicle extends StatelessWidget {
  bool noData = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Vehicle"),
      ),
      body: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: size.height, maxWidth: size.width),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: size.height / 2,
                  color: kPrimaryDark,
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  padding: EdgeInsets.all(10),
                  child: noData ? buildAddKTM(size) : buildBikeInfo(size),
                ),
                Container(
                  height: 40,
                  width: double.maxFinite,
                  color: kPrimaryDark,
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "COMMUNITY",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center buildAddKTM(Size size) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Icon(
              Icons.add_circle_outline,
              size: size.width / 2,
              color: Colors.white10,
            ),
          ),
          Text(
            "CLICK HERE TO ADD YOUR VEHICLE",
            style: TextStyle(
              color: Colors.white12,
            ),
          )
        ],
      ),
    );
  }

  Column buildBikeInfo(Size size) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            width: double.maxFinite,
            child: Image(
              image: AssetImage("assets/ktm-2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width / 2.5,
                child: Text(
                  "owner_name",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white60),
                ),
              ),
              SizedBox(
                width: size.width / 2.5,
                child: Text(
                  "Vehicle Age",
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white60),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width / 2.5,
              child: Text(
                "owner_place",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white60),
              ),
            ),
            SizedBox(
              width: size.width / 2.5,
              child: Text(
                "2 Years",
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white60),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width / 2.5,
                child: Text(
                  "KL-XX-AQ-XXXX",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white60),
                ),
              ),
              SizedBox(
                width: size.width / 2.5,
                child: Text(
                  "Last Service Read",
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white60),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width / 2.5,
              child: Text(
                "KTM RC 125",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white60),
              ),
            ),
            SizedBox(
              width: size.width / 2.5,
              child: Text(
                "9335",
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white60),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("DELETE VEHICLE PROFILE"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width / 4.3, vertical: 0),
              primary: kAlertRed,
            ),
          ),
        )
      ],
    );
  }
}
