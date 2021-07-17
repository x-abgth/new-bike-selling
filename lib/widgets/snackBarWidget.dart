import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Hellloooooo",
            style: TextStyle(color: Colors.white),
          )));
          return SizedBox();
        },
      ),
    );
  }
}
