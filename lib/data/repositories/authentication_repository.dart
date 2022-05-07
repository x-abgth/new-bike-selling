import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/constants.dart';

abstract class AuthMain {
  signUpFunc();
  signInFunc();
  String getUserId(String email) {
    List<String> head = email.split('@');
    List<String> tail = head[1].split('.');
    return (head[0] + tail[0]);
  }
}

class AuthenticationRepository extends AuthMain {
  @override
  Future<String> signUpFunc({
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
      "id": getUserId(emailTC),
      "name": "${fnameTC + " " + lnameTC}",
      "address":
          "${areaTC + "\n" + townTC + "\n" + districtTC + ", " + pinTC + "\n" + stateTC}",
      "dob": unformattedSelectedDate,
      "phone": phNoTC,
      "mail": emailTC,
      "password": passTC,
    });
    if (response.statusCode == 200) {
      final String data = json.decode(response.body);
      return data;
    }
    return "error";
  }

  @override
  Future<String> signInFunc(
      {@required String email, @required String password}) async {
    var response = await http.post(
      Uri.parse(userLoginUrl),
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      final String message = json.decode(response.body);
      return message;
    }
    return "error";
  }
}
