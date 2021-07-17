import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ktm/sections/BikeDataGrid.dart';
import 'dart:async';
import 'package:ktm/widgets/HomePageWidgets/SearchBar.dart';
import '../../utils/constants.dart';

class ExploreBikes extends StatefulWidget {
  @override
  _ExploreBikesState createState() => _ExploreBikesState();
}

class _ExploreBikesState extends State<ExploreBikes> {
  List datas;
  Widget _content = Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryDark),
    ),
  );

  // fetch data from the internet
  Future fetchBikeData() async {
    final response = await http.get(Uri.parse(bikesUrl));
    if (response.statusCode == 200) {
      datas = json.decode(response.body);
      return datas;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Bikes"),
        actions: [SearchBar(), SizedBox(width: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width),
            child: FutureBuilder(
              future: fetchBikeData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return buildErrorCode();
                } else if (snapshot.hasData && snapshot.data != null) {
                  return BikeDataGrid(snapshot: snapshot.data);
                }

                Future.delayed(Duration(seconds: 30), () {
                  Widget retry = Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Unable to access data!",
                            style: TextStyle(color: kPrimaryDark),
                          ),
                          TextButton.icon(
                            onPressed: () async {
                              await Get.off(ExploreBikes());
                            },
                            icon: Icon(
                              Icons.refresh,
                              color: kPrimary,
                            ),
                            label: Text(
                              "Retry",
                              style: TextStyle(color: kPrimary),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                  if (mounted) {
                    setState(() {
                      _content = retry;
                    });
                  }
                });

                return _content;
              },
            )),
      ),
    );
  }

  Widget buildErrorCode() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "Something went wrong!",
          style: TextStyle(
            color: kPrimaryDark,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}
