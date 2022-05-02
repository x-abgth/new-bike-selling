import 'package:flutter/material.dart';
import 'package:ktm/data/providers/providerClass.dart';
import 'package:ktm/presentation/screens/profile_screen/widgets/ProfileEditBodySection.dart';
import 'package:ktm/presentation/screens/profile_screen/widgets/ProfileHeaderSection.dart';
import 'package:ktm/core/constants/constants.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  // should be saved in shared pref
  final bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderClass(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Personal Information",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColorDark,
          actions: [
            isLoggedIn
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: kAlertRed,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () => print("Logout"),
                      label: Text(
                        "LOGOUT",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      icon: Icon(Icons.power_settings_new_outlined,
                          color: Colors.white),
                    ),
                  )
                : SizedBox(),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                ProfileHeaderSection(),
                Divider(
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                ProfileEditBodySection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
