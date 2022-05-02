import 'package:flutter/material.dart';
import 'package:ktm/data/providers/providerClass.dart';
import 'package:provider/provider.dart';

class ProfileEditWidget extends StatefulWidget {
  @override
  _ProfileEditWidgetState createState() => _ProfileEditWidgetState();
}

class _ProfileEditWidgetState extends State<ProfileEditWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        Provider.of<ProviderClass>(context, listen: false).changeValue(true);
      },
      splashColor: Colors.grey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Column(
          children: [
            Icon(Icons.edit, color: Colors.grey, size: 18),
            Text(
              "EDIT",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
