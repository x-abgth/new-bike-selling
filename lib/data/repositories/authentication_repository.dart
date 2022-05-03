import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/constants.dart';

abstract class AuthMain {
  signUpFunc();
  signInFunc();
}

class AuthenticationRepository extends AuthMain {
  @override
  signUpFunc({
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
  signInFunc({@required String email, @required String password}) {
    // TODO: implement signUpFunc
    throw UnimplementedError();
  }
}
