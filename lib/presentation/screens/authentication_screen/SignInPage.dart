import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/presentation/screens/authentication_screen/SignUpPage.dart';
import 'package:ktm/presentation/screens/authentication_screen/widgets/ktm_logo_widget.dart';
import 'package:ktm/presentation/widgets/bottom_nav_bar.dart';

import '../../../core/constants/constants.dart';
import '../../../logics/blocs/auth_bloc/auth_bloc.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  bool visible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticating) {
            return CircularProgressIndicator();
          }
          if (state is Authenticated) {
            return Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavBar()));
          }
          if (state is AuthenticationError) {
            return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: kPrimaryDark,
                content: Text(
                  state.errorMsg,
                  style: TextStyle(color: Colors.white),
                )));
          }
        },
        child: Container(
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildSignupForm(context, "Enter Email ID", Icons.mail,
                            false, _emailController),
                        SizedBox(height: 20),
                        buildSignupForm(context, "Enter Password", Icons.lock,
                            true, _passwordController),
                        SizedBox(height: 30),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(SignInRequested());
                            }
                          },
                          child: Text("SIGN-IN"),
                          style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            primary: Colors.white,
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 13),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar()));
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
                  ),
                )
              ],
            ),
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
          child: TextFormField(
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
            keyboardType:
                protection ? TextInputType.text : TextInputType.emailAddress,
            textInputAction:
                protection ? TextInputAction.done : TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid input";
              }
              return "";
            },
          ),
        ),
      ],
    );
  }
}
