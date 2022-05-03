import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../core/constants/constants.dart';

abstract class AuthMain {
  signUpFunc();
  signInFunc();
}

class AuthenticationRepository extends AuthMain {
  @override
  Future<Response> signUpFunc({
    @required BuildContext context,
    @required GlobalKey<FormState> key,
    @required String fnameTC,
    @required String lnameTC,
    @required String areaTC,
    @required String townTC,
    @required String districtTC,
    @required String pinTC,
    @required String stateTC,
    @required String phNoTC,
    @required String emailTC,
    @required String passTC,
    @required String unformattedSelectedDate,
  }) async {
    final response = await http.post(Uri.parse(addUserUrl), body: {
      "name": "${fnameTC + " " + lnameTC}",
      "address":
          "${areaTC + "\n" + townTC + "\n" + districtTC + ", " + pinTC + "\n" + stateTC}",
      "dob": unformattedSelectedDate,
      "phone": phNoTC,
      "mail": emailTC,
      "password": passTC,
    });
    return response;
  }

  @override
  Future signInFunc({@required String email, @required String password}) async {
    // Store all data with Param Name.
    var data = {'email': email, 'password': password};
    // Starting Web API Call.
    var response = await http.post(
      Uri.parse(userLoginUrl),
      body: json.encode(data),
    );
    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    return message;
    // If the Response Message is Matched.
    // if (message == 'Login Matched') {}
  }
}
