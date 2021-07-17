import 'package:url_launcher/url_launcher.dart';
import './constants.dart';

launchManUrl() async {
  if (await canLaunch(manualUrl)) {
    await launch(manualUrl);
  } else {
    throw 'Coud not launch $manualUrl';
  }
}

browser() async {
  await launchManUrl();
}
