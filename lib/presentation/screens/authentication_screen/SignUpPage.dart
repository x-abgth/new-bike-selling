import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/data/repositories/authentication_repository.dart';
import 'package:ktm/presentation/screens/authentication_screen/widgets/ktm_logo_widget.dart';
import 'package:ktm/presentation/widgets/bottom_nav_bar.dart';
import '../../../core/constants/constants.dart';
import 'package:date_format/date_format.dart';

import '../../../logics/blocs/auth_bloc/auth_bloc.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  TextEditingController fnameTC = TextEditingController();
  TextEditingController lnameTC = TextEditingController();
  TextEditingController dobTC = TextEditingController();
  TextEditingController areaTC = TextEditingController();
  TextEditingController townTC = TextEditingController();
  TextEditingController districtTC = TextEditingController();
  TextEditingController stateTC = TextEditingController();
  TextEditingController pinTC = TextEditingController();
  TextEditingController phNoTC = TextEditingController();
  TextEditingController emailTC = TextEditingController();
  TextEditingController passTC = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldMessengerState> _scaffoldMsngrKey =
      GlobalKey<ScaffoldMessengerState>();
  bool _isDateSelected = false;
  var _unformattedSelectedDate;

  void dispose() {
    fnameTC.dispose();
    lnameTC.dispose();
    dobTC.dispose();
    areaTC.dispose();
    districtTC.dispose();
    stateTC.dispose();
    pinTC.dispose();
    phNoTC.dispose();
    emailTC.dispose();
    passTC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMsngrKey,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticating) {
            return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                title: Text("Please wait. Signing up..."),
                content: Row(
                  children: [
                    Spacer(),
                    CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                    Spacer(),
                  ],
                ),
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
            );
          }
          if (state is Authenticated) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavBar()));
          }
          if (state is AuthenticationError) {
            Navigator.pop(context);
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
                    Container(
                      height: MediaQuery.of(context).size.height / 5.0,
                      margin: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.chevron_left,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              "SIGN-IN PAGE",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    KtmLogoWidget(),
                  ],
                ),
                SizedBox(height: 30),
                Card(
                  margin: EdgeInsets.all(20),
                  color: Colors.black,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: buildSignupForm(
                                  context: context,
                                  controller: fnameTC,
                                  label: "Enter First Name",
                                  func: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                  icon: Icons.person),
                            ),
                            Flexible(
                              child: buildSignupForm(
                                  context: context,
                                  controller: lnameTC,
                                  label: "Enter Last Name",
                                  func: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                  }),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => _datePicker(context: context),
                                  child: _isDateSelected
                                      ? Text(formatDate(
                                          _unformattedSelectedDate,
                                          [dd, '-', mm, '-', yyyy]))
                                      : Text(
                                          "Select date of birth",
                                          style: TextStyle(
                                              color: Colors.white54,
                                              fontFamily: "Roboto",
                                              fontSize: 16),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        buildSignupForm(
                            context: context,
                            controller: areaTC,
                            label: "Enter Street/Area/House No.",
                            func: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is required";
                              }
                            },
                            icon: Icons.home),
                        buildSignupForm(
                            context: context,
                            controller: townTC,
                            label: "Enter Locality/Town",
                            func: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is required";
                              }
                            },
                            icon: Icons.location_searching_outlined),
                        Row(
                          children: [
                            Flexible(
                              child: buildSignupForm(
                                  context: context,
                                  controller: districtTC,
                                  label: "Enter City/District",
                                  func: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                  icon: Icons.location_city_outlined),
                            ),
                            Flexible(
                              child: buildSignupForm(
                                  context: context,
                                  controller: stateTC,
                                  label: "Enter State",
                                  func: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                  }),
                            ),
                          ],
                        ),
                        buildSignupForm(
                            context: context,
                            controller: pinTC,
                            label: "Enter Pincode",
                            func: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is required";
                              }
                            },
                            icon: Icons.pin_drop_outlined),
                        buildSignupForm(
                            context: context,
                            controller: phNoTC,
                            label: "Enter Mobile Number",
                            func: (value) {
                              if (value.length != 10 || value.isEmpty) {
                                return "Enter a valid phone number";
                              }
                            },
                            icon: Icons.call),
                        buildSignupForm(
                            context: context,
                            controller: emailTC,
                            label: "Enter Email ID",
                            func: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter a valid email id";
                              }
                            },
                            icon: Icons.mail),
                        buildSignupForm(
                          context: context,
                          controller: passTC,
                          label: "Enter Password",
                          func: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a password";
                            }
                          },
                          protection: true,
                          icon: Icons.lock,
                        ),
                        SizedBox(height: 30),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState.validate() &&
                                _unformattedSelectedDate != null) {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(SignUpRequested(
                                key: _formKey,
                                context: context,
                                dob: formatDate(_unformattedSelectedDate,
                                    [yyyy, '-', mm, '-', dd]),
                                firstName: fnameTC.text,
                                lastName: lnameTC.text,
                                email: emailTC.text,
                                password: passTC.text,
                                street: areaTC.text,
                                city: districtTC.text,
                                town: townTC.text,
                                state: stateTC.text,
                                phNumber: phNoTC.text,
                                pinCode: pinTC.text,
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: kPrimaryDark,
                                      content: Text(
                                        "Please input all the fields!",
                                        style: TextStyle(color: Colors.white),
                                      )));
                            }
                          },
                          child: Text("SIGN-UP"),
                          style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            primary: Colors.white,
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignupForm(
      {@required BuildContext context,
      @required String label,
      @required Function func,
      @required TextEditingController controller,
      bool protection = false,
      IconData icon = null,
      String hint = null}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: icon == null
                ? SizedBox(width: 5)
                : Icon(
                    icon,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
          ),
          Flexible(
            child: TextFormField(
              controller: controller,
              obscureText: protection,
              enabled: true,
              cursorHeight: 23,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontFamily: "Heebo"),
              decoration: InputDecoration(
                  hintText: hint ?? "",
                  hintStyle: TextStyle(color: kPrimaryDark),
                  labelText: label,
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor))),
              validator: func,
            ),
          ),
        ],
      ),
    );
  }

  bool selectDateRange(
    DateTime dateTime,
  ) {
    if (dateTime.isAfter(DateTime.now().subtract(Duration(days: 365 * 100)))) {
      return true;
    }
    return false;
  }

  _datePicker({@required BuildContext context}) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().subtract(Duration(days: 365 * 18)),
        firstDate: DateTime.now().subtract(Duration(days: 365 * 100)),
        lastDate: DateTime.now().subtract(Duration(days: 365 * 18)),
        selectableDayPredicate: selectDateRange,
        builder: (context, child) {
          return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.light(
                  primary: Theme.of(context).primaryColor,
                  onSurface: Colors.white,
                ),
                buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
              child: child);
        });

    if (picked != null && picked != _unformattedSelectedDate) {
      setState(() {
        _isDateSelected = true;
        _unformattedSelectedDate = picked;
      });
    }
  }
}
