import 'package:flutter/material.dart';
import 'presentation/widgets/NavSection.dart';
import 'core/constants/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "KTM",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        canvasColor: Colors.black,
        primaryColor: kPrimary,
        primaryColorDark: kPrimaryDark,
        colorScheme: ThemeData().colorScheme.copyWith(secondary: kAccent),
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText2: TextStyle(
                fontFamily: "Iceland",
                color: Colors.white,
                fontSize: 20,
              ),
            ),
        iconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: "Roboto",
            color: kPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
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
