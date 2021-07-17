import 'package:flutter/material.dart';
import 'package:ktm/provider/providerClass.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';

class ProfileEditBodySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isPressed = Provider.of<ProviderClass>(context).isPressed;
    return Container(
      // Implement provider and use isPressed value instead of editValue
      child: isPressed
          ? Form(
              child: Column(
                children: [
                  buildEditInfo(
                    quest: "What is your name ?",
                    valid: (value) {
                      if (value.isEmpty) {
                        return "Please enter your name";
                      }
                    },
                    label: "Enter your name",
                  ),
                  buildEditInfo(
                    quest: "What do you identify as ?",
                    valid: (value) {
                      if (value.isEmpty) {
                        return "Please mention your gender";
                      }
                    },
                    label: "Enter your gender",
                  ),
                  buildEditInfo(
                    quest: "Where do you live ?",
                    valid: (value) {
                      if (value.isEmpty) {
                        return "Please enter a valid address";
                      }
                    },
                    label: "Enter your Residential address",
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<ProviderClass>(context, listen: false)
                          .changeValue(false);
                    },
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          : Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 1.7,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.049,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(ktmOrangeLogo),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    // Text(
                    //   "\"FEEL THE THRILL!\"",
                    //   style: TextStyle(color: Colors.grey[700], fontSize: 20),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }

  ListTile buildEditInfo({String quest, String valid(value), String label}) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      title: Text(
        "$quest",
        style:
            TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Poppins"),
      ),
      subtitle: TextFormField(
        validator: valid,
        cursorColor: kPrimary,
        cursorHeight: 23,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Poppins",
          fontSize: 15,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          // filled: true,
          labelText: "$label",
          labelStyle: TextStyle(color: Colors.grey[800]),
        ),
      ),
    );
  }
}
