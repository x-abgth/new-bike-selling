import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class CommunityPostsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 422,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: kPrimary,
                    backgroundImage: AssetImage(ktmBlackLogo),
                  ),
                  title: Text("ktm_knr"),
                ),
                SizedBox(
                  height: 300,
                  child: Image(
                    image: AssetImage("assets/images/ktm-3.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      "KTM Adventure",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 20,
            color: kPrimaryDark,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            // color: Colors.blue,
            height: 380,
            width: double.maxFinite,
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                      backgroundColor: kPrimary,
                      backgroundImage: AssetImage(ktmBlackLogo)),
                  title: Text("ktm_knr"),
                ),
                SizedBox(
                  height: 300,
                  child: Image(
                    image: AssetImage("assets/images/ktm-3.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
