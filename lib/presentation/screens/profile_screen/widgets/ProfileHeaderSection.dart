import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ktm/presentation/screens/authentication_screen/SignInPage.dart';
import 'package:ktm/core/constants/constants.dart';
import 'ProfileEditWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileHeaderSection extends StatefulWidget {
  @override
  _ProfileHeaderSectionState createState() => _ProfileHeaderSectionState();
}

class _ProfileHeaderSectionState extends State<ProfileHeaderSection> {
  int editValue;
  // should be saved in sharedPref
  bool isLoggedIn = false;
  File image;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: isLoggedIn ? () => chngDp(context) : () {},
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: kPrimaryDark, width: 3),
                    image: DecorationImage(
                      // if value of shared pref is empty then display default image
                      image: image != null
                          ? FileImage(image)
                          : AssetImage("assets/images/default-avatar.jpg"),
                    )),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: isLoggedIn
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Username",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 22)),
                        Text("Bike Model",
                            style: TextStyle(color: Colors.grey, fontSize: 15))
                      ],
                    )
                  : SizedBox(),
            )),
            isLoggedIn
                ? ProfileEditWidget()
                : ElevatedButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignInPage())),
                    child: Text("LOGIN"),
                    style: ElevatedButton.styleFrom(
                      primary: kPrimary,
                      onSurface: Colors.white,
                    ),
                  ),
          ],
        ));
  }

  Future pickImage({ImageSource imageSource = ImageSource.camera}) async {
    try {
      // getting image
      final _image = await picker.getImage(
        source: imageSource,
      );

      if (_image == null) {
        Navigator.of(context).pop();
        return null;
      }

      setState(() {
        // saving image path in shared preference
        image = File(image.path);
      });
      Navigator.of(context).pop();
    } catch (_) {
      Fluttertoast.showToast(
        msg: "An error occured!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.of(context).pop();
    }
  }

  Future<void> chngDp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: BeveledRectangleBorder(),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(width: 20),
                      Text(
                        "Open camera",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () => pickImage(imageSource: ImageSource.camera),
                ),
                Padding(padding: EdgeInsets.all(20)),
                GestureDetector(
                    child: Row(
                      children: [
                        Icon(Icons.photo_library_outlined),
                        SizedBox(width: 20),
                        Text(
                          "Select from files",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () => pickImage(imageSource: ImageSource.gallery)),
                Padding(padding: EdgeInsets.all(20)),
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.no_accounts_outlined),
                      SizedBox(width: 20),
                      Text(
                        "Remove photo",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      image = null;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
