import 'package:url_launcher/url_launcher.dart';
import './constants.dart';

launchUrl() async {
  if (await canLaunch(bikeBookingUrl)) {
    await launch(bikeBookingUrl);
  } else {
    throw 'Coud not launch $bikeBookingUrl';
  }
}

browser() async {
  await launchUrl();
}
