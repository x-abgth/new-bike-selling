import 'package:url_launcher/url_launcher.dart';
import '../constants/constants.dart';

launchUrlWeb() async {
  try {
    await launchUrl(Uri.parse(bikeBookingUrl));
  } catch (e) {
    throw Exception('Coud not launch $bikeBookingUrl');
  }
}

browser() async {
  await launchUrlWeb();
}
