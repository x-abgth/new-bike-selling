import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class KtmLogoWidget extends StatelessWidget {
  const KtmLogoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 140,
      margin: EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 20),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: Theme.of(context).primaryColor,
      child: Image(
        image: AssetImage(ktmBlackLogo),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
