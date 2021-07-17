import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ktm/pages/SignUpPage.dart';
import 'package:ktm/sections/NavSection.dart';
import 'package:ktm/utils/constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool visible;
  @override
  Widget build(BuildContext context) {
    Widget ktmLogo = Container(
      height: 160,
      width: 140,
      margin: EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 20),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: Theme.of(context).primaryColor,
      child: Image(
        image: AssetImage(ktmBlackLogo),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ktmLogo,
                ],
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  return Get.offAll(() => SignUpPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "SIGN-UP PAGE",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.none),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(20),
                color: Colors.black,
                child: Column(
                  children: [
                    buildSignupForm(context, "Enter Email ID", Icons.mail,
                        false, _emailController),
                    SizedBox(height: 20),
                    buildSignupForm(context, "Enter Password", Icons.lock, true,
                        _passwordController),
                    SizedBox(height: 30),
                    TextButton(
                      onPressed: signInBtn,
                      child: Text("SIGN-IN"),
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        primary: Colors.white,
                        shape: StadiumBorder(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 8),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(NavSection());
                      },
                      child: Text(
                        "SKIP SIGN-IN",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          decoration: TextDecoration.underline,
                          letterSpacing: 2,
                          wordSpacing: 2,
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signInBtn() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String email = _emailController.text;
    String password = _passwordController.text;

    // Store all data with Param Name.
    var data = {'email': email, 'password': password};

    // Starting Web API Call.
    var response =
        await http.post(Uri.parse(userLoginUrl), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Login Matched') {
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      Get.to(() => NavSection());
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON Message.
      Get.defaultDialog(
        title: message,
        middleText: "Hello world!",
        backgroundColor: Colors.green,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        textConfirm: "OK",
        onConfirm: () => Get.back(),
      );
    }
  }

  Widget buildSignupForm(BuildContext context, String label, IconData icon,
      bool protection, TextEditingController _controller) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
        ),
        Flexible(
          child: TextField(
            controller: _controller,
            obscureText: protection,
            enabled: true,
            cursorHeight: 23,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white, fontFamily: "Heebo"),
            decoration: InputDecoration(
                labelText: "$label",
                labelStyle: TextStyle(color: Colors.grey[600]),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor))),
          ),
        ),
      ],
    );
  }
}
