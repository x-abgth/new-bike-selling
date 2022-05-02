import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/constants.dart';
import '../../my_vehicle_screen/MyVehicle.dart';
import '../../explore_bikes_screen/ExploreBikes.dart';
import '../../contact_screen/Contact.dart';
import '../../feedbacks_screen/Feedbacks.dart';
import '../../ktm_community_screen/KtmCommunity.dart';
import '../../service_screen/MyService.dart';
import '../../ktm_map_screen/NearestKtm.dart';
import 'package:ktm/presentation/screens/home_screen/widgets/HomePageMenuCard.dart';

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
                cardTapFunc: () =>
                    buildNavigateToNext(page: ExploreBikes(), context: context),
              ),
              HomePageMenuCard(
                title: "My Vehicle",
                icon: FontAwesomeIcons.biking,
                cardTapFunc: () =>
                    buildNavigateToNext(page: MyVehicle(), context: context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageMenuCard(
                title: "My Service",
                icon: Icons.miscellaneous_services,
                cardTapFunc: () =>
                    buildNavigateToNext(page: MyService(), context: context),
              ),
              HomePageMenuCard(
                title: "Nearest KTM",
                icon: FontAwesomeIcons.map,
                cardTapFunc: () =>
                    buildNavigateToNext(page: NearestKtm(), context: context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageMenuCard(
                title: "KTM Community",
                icon: Icons.group_sharp,
                cardTapFunc: () =>
                    buildNavigateToNext(page: KtmCommunity(), context: context),
              ),
              HomePageMenuCard(
                title: "Owners Manual",
                icon: Icons.library_books,
                cardTapFunc: () =>
                    buildNavigateToNext(isUrl: true, context: context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageMenuCard(
                title: "Feedbacks",
                icon: Icons.feedback,
                cardTapFunc: () =>
                    buildNavigateToNext(page: Feedbacks(), context: context),
              ),
              HomePageMenuCard(
                title: "Contact",
                icon: Icons.call,
                cardTapFunc: () =>
                    buildNavigateToNext(page: Contact(), context: context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildNavigateToNext(
      {@required BuildContext context, Widget page, bool isUrl = false}) {
    return isUrl
        ? launchManUrl()
        : Navigator.push(
            context, MaterialPageRoute(builder: (context) => page));
  }
}

launchManUrl() async {
  try {
    await launchUrl(Uri.parse(manualUrl));
  } catch (e) {
    throw Exception('Coud not launch $manualUrl');
  }
}
