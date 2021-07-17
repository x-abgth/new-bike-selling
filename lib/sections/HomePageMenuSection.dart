import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/HomePageRoutes/MyVehicle.dart';
import '../pages/HomePageRoutes/ExploreBikes.dart';
import '../pages/HomePageRoutes/Contact.dart';
import '../pages/HomePageRoutes/Feedbacks.dart';
import '../pages/HomePageRoutes/KtmCommunity.dart';
import '../pages/HomePageRoutes/MyService.dart';
import '../pages/HomePageRoutes/NearestKtm.dart';
import '../utils/ManualUrlFunc.dart';
import 'package:ktm/widgets/HomePageWidgets/HomePageMenuCard.dart';

class HomePageMenuSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageMenuCard(
                title: "Explore Bikes",
                icon: FontAwesomeIcons.store,
                cardTapFunc: () => buildNavigateToNext(page: ExploreBikes()),
              ),
              HomePageMenuCard(
                title: "My Vehicle",
                icon: FontAwesomeIcons.biking,
                cardTapFunc: () => buildNavigateToNext(page: MyVehicle()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageMenuCard(
                title: "My Service",
                icon: Icons.miscellaneous_services,
                cardTapFunc: () => buildNavigateToNext(page: MyService()),
              ),
              HomePageMenuCard(
                title: "Nearest KTM",
                icon: FontAwesomeIcons.map,
                cardTapFunc: () => buildNavigateToNext(page: NearestKtm()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageMenuCard(
                title: "KTM Community",
                icon: Icons.group_sharp,
                cardTapFunc: () => buildNavigateToNext(page: KtmCommunity()),
              ),
              HomePageMenuCard(
                title: "Owners Manual",
                icon: Icons.library_books,
                cardTapFunc: () => buildNavigateToNext(isUrl: true),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageMenuCard(
                title: "Feedbacks",
                icon: Icons.feedback,
                cardTapFunc: () => buildNavigateToNext(page: Feedbacks()),
              ),
              HomePageMenuCard(
                title: "Contact",
                icon: Icons.call,
                cardTapFunc: () => buildNavigateToNext(page: Contact()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildNavigateToNext({Widget page, bool isUrl = false}) {
    return isUrl ? launchManUrl() : Get.to(() => page);
  }
}
