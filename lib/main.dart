import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'sections/NavSection.dart';
import 'utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "KTM",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        canvasColor: Colors.black,
        primaryColor: kPrimary,
        primaryColorDark: kPrimaryDark,
        accentColor: kAccent,
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText2: TextStyle(
                fontFamily: "Iceland",
                color: Colors.white,
                fontSize: 20,
              ),
            ),
        iconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.dark().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: "Roboto",
                  color: kPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          color: Colors.black,
          iconTheme: IconThemeData(color: kPrimary),
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: NavSection(),
    );
  }
}
