import 'package:flutter/material.dart';
import 'package:ktm/core/constants/constants.dart';

class OwnersManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Owners Manual"),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 100,
          child: Text(
            "Sorry, Couldn't find any manual",
            style: TextStyle(
              color: kPrimaryDark,
            ),
          ),
        ),
      ),
    );
  }
}
