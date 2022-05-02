import 'package:flutter/material.dart';
import 'package:ktm/core/constants/constants.dart';

class MyService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Service"),
      ),
      body: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: size.width, maxHeight: size.height),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildServiceCards(
                  isNext: true,
                  date: "13/12/2020",
                  km: "10999",
                  rate: "750",
                  title: "Next Service",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Text(
                    "Recent Services",
                    style: TextStyle(
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                buildServiceCards(
                  date: "13/12/2020",
                  km: "10999",
                  rate: "750",
                  title: "June",
                ),
                buildServiceCards(
                  date: "13/12/2020",
                  km: "10999",
                  rate: "750",
                  title: "Next Service",
                ),
                buildServiceCards(
                  date: "13/12/2020",
                  km: "10999",
                  rate: "750",
                  title: "Next Service",
                ),
                buildServiceCards(
                  date: "13/12/2020",
                  km: "10999",
                  rate: "750",
                  title: "Next Service",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildServiceCards({
    String title,
    String date,
    String rate,
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
            color: isNext ? kPrimary : kPrimaryDark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(date),
                  Text("$km km"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Approx. Price:"),
                  Text("₹$rate/-"),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
