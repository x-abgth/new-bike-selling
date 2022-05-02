import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageMenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function cardTapFunc;

  HomePageMenuCard(
      {@required this.title, @required this.icon, this.cardTapFunc});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 70,
        margin: EdgeInsets.all(10),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColorDark,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: cardTapFunc,
            enableFeedback: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 25,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
