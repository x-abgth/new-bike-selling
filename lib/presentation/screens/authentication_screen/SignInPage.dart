import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ktm/presentation/screens/authentication_screen/SignUpPage.dart';
import 'package:ktm/presentation/screens/authentication_screen/widgets/ktm_logo_widget.dart';
import 'package:ktm/presentation/widgets/NavSection.dart';
import 'package:ktm/core/constants/constants.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool visible;

  @override
  Widget build(BuildContext context) {
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
                  KtmLogoWidget(),
                ],
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage())),
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => NavSection()));
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

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NavSection()));
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON Message.
      // Get.defaultDialog(
      //   title: message,
      //   middleText: "Hello world!",
      //   backgroundColor: Colors.green,
      //   titleStyle: TextStyle(color: Colors.white),
      //   middleTextStyle: TextStyle(color: Colors.white),
      //   textConfirm: "OK",
      //   onConfirm: () => Get.back(),
      // );
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
