import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ktm/pages/HomePageRoutes/MyService.dart';
import 'package:ktm/sections/CommunityPostsSection.dart';
import 'package:ktm/utils/constants.dart';

class KtmCommunity extends StatefulWidget {
  @override
  _KtmCommunityState createState() => _KtmCommunityState();
}

class _KtmCommunityState extends State<KtmCommunity> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Community"),
        ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 55,
              backgroundColor: Colors.black,
              bottom: TabBar(
                labelPadding: EdgeInsets.all(10),
                labelColor: kPrimary,
                unselectedLabelColor: Colors.grey[700],
                indicatorColor: kPrimary,
                tabs: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_album),
                      SizedBox(width: 5),
                      Text("POSTS"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people),
                      SizedBox(width: 5),
                      Text("MEMBERS"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.electric_bike),
                      SizedBox(width: 5),
                      Text("RIDES"),
                    ],
                  ),
                ],
              ),
            ),
            body: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: size.height,
                  maxWidth: size.width,
                ),
                child: TabBarView(
                  children: [
                    CommunityPostsSection(),
                    ListView(
                      children: [
                        ListTile(
                          tileColor: kPrimaryDark,
                          title: Text("Abhijith A"),
                          subtitle: Text("Elayavoor"),
                          trailing: Text("KTM RC 390"),
                        ),
                        ListTile(
                          tileColor: kPrimaryDark,
                          title: Text("Abhijith A"),
                          subtitle: Text("Elayavoor"),
                          trailing: Text("KTM RC 390"),
                        ),
                        ListTile(
                          tileColor: kPrimaryDark,
                          title: Text("Abhijith A"),
                          subtitle: Text("Elayavoor"),
                          trailing: Text("KTM RC 390"),
                        ),
                      ],
                    ),
                    rideCards(
                      title: "KTM Orange Day Ride",
                      subtitle: "@KTM kannur, Melechovva",
                      date: "24th October",
                      from: "Kannur",
                      isNext: true,
                      km: "500",
                      to: "Wayanad",
                    )
                  ],
                )),
          ),
        ));
  }

  Column rideCards({
    String title,
    String subtitle,
    String date,
    String from,
    String to,
    String km,
    bool isNext = false,
  }) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 150,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kPrimaryDark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              Text(subtitle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("From"),
                      Text(from),
                    ],
                  ),
                  Column(
                    children: [
                      Text("To"),
                      Text(to),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
