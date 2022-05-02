import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/global/BookingUrlFunc.dart';
import '../../bike_details_screen/ViewPage.dart';

class BikeDataGrid extends StatelessWidget {
  final dynamic snapshot;

  BikeDataGrid({@required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: snapshot == null ? 0 : snapshot.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.76,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: kPrimaryDark, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    navigateToView(
                        index: index,
                        snapshot: snapshot[index],
                        context: context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Hero(
                              tag:
                                  "$bikesImgUrl${snapshot[index]['m_image_a']}",
                              child: Image(
                                  image: NetworkImage(
                                      "$bikesImgUrl${snapshot[index]['m_image_a']}")),
                            ),
                          )),
                      Container(
                        height: 45,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          snapshot[index]['m_name'],
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 10),
                        child: Text(
                          "₹${snapshot[index]['m_price']}",
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      SizedBox(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextButton(
                            child: Text(
                              "BOOK",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              browser();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future navigateToView({@required BuildContext context, index, snapshot}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ViewPage(index: index, snapshot: snapshot)));
  }
}
