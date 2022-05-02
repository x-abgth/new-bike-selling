import 'package:flutter/material.dart';
import 'package:ktm/presentation/screens/home_screen/widgets/HomePageCarousel.dart';
import '../../../core/constants/constants.dart';

class HomePageA extends StatefulWidget {
  @override
  _HomePageAState createState() => _HomePageAState();
}

class _HomePageAState extends State<HomePageA> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    Widget ktmLogo = Container(
      height: 100,
      width: 80,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: Theme.of(context).primaryColor,
      child: Image(
        image: AssetImage(ktmBlackLogo),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: ListTile(
                contentPadding: EdgeInsets.only(top: 30),
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(defaultAvatar),
                      )),
                ),
                title: Text(
                  "Abhijith",
                  style: TextStyle(color: kPrimary, fontSize: 20),
                ),
                onTap: () {},
              ),
            ),
            buildListTile(iconData: Icons.home, title: "Home", action: () {}),
            SizedBox(height: 20),
            buildListTile(
                iconData: Icons.bike_scooter,
                title: "Exlore Bikes",
                action: () {}),
            buildListTile(
                iconData: Icons.bike_scooter,
                title: "My Vehicle",
                action: () {}),
            buildListTile(
                iconData: Icons.settings_accessibility,
                title: "My Service",
                action: () {}),
            buildListTile(
                iconData: Icons.map, title: "Nearest KTM", action: () {}),
            buildListTile(
                iconData: Icons.people, title: "KTM Community", action: () {}),
            buildListTile(
                iconData: Icons.feedback, title: "Feedbacks", action: () {}),
            buildListTile(
                iconData: Icons.call, title: "Contact", action: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Builder(
                    builder: (context) => GestureDetector(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: buildUSerHeader(context),
                    ),
                  ),
                ),
                Spacer(),
                ktmLogo,
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 50, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "Choose your ",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  Text(
                    "KTM",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 23),
                  ),
                ],
              ),
            ),
            HomePageCarousel(
              indi: false,
              duration: 2000,
              images: carouselList,
              height: 3.5,
            ),
            Container(
              color: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 15,
                  children: [
                    buildChips(index: 0, title: "All"),
                    buildChips(index: 1, title: "Travel"),
                    buildChips(index: 2, title: "Naked Bike"),
                    buildChips(index: 3, title: "Supersport"),
                  ],
                ),
              ),
            ),
            Container(
              height: 450,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return index < 4
                        ? ListTile(
                            leading: Image.asset("assets/ktm-1.jpg"),
                            title: Text(
                              "KTM Duke 390",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("3,00,000"),
                            trailing: Icon(
                              Icons.chevron_right_outlined,
                              size: 30,
                            ),
                            onTap: () {},
                          )
                        : ListTile(
                            leading: SizedBox(
                                width: MediaQuery.of(context).size.width / 3.5),
                            title: Text(
                              "View All",
                              style: TextStyle(fontSize: 20),
                            ),
                            onTap: () {},
                          );
                  },
                  separatorBuilder: (context, int) => Divider(
                        color: kPrimaryDark,
                      ),
                  itemCount: 5),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile({IconData iconData, String title, Function action}) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      onTap: action,
    );
  }

  Widget buildUSerHeader(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/default-avatar.jpg"))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Abhijith",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 20),
                ),
                Text(
                  "Duke 390",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ChoiceChip buildChips({int index, String title}) {
    return ChoiceChip(
      selectedColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryColorDark,
      padding: EdgeInsets.symmetric(horizontal: 15),
      label: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      selected: selected == index,
      onSelected: (value) {
        setState(() {
          selected = value ? index : 0;
        });
      },
    );
  }

  Container buildOptionCards(
      BuildContext context, String name, IconData iconData) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 2.25,
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(
            iconData,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "$name",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
