import 'package:flutter/material.dart';
import '../utils/constants.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: kPrimary,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(ktmBlackLogo), fit: BoxFit.cover),
                  ),
                ),
                title: Text(
                  "Booking approved!",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Hey team, we have three different topic training classes for you to come to. 17/03/2000. Please respond with the time you want. Space is limited and is first come.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }),
      ),
    );
  }
}
