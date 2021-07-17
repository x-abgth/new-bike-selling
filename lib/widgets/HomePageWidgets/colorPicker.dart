// import 'package:flutter/material.dart';
// import '../../utils/constants.dart';

// class ColorPicker {
//   Widget colorContainer({String color, int index = 0, int selectedIndex = 0}) {
//     if (color == "Orange") {
//       return colorCircles(color: kPrimary, isSelected: isSelected);
//     } else if (color == "White") {
//       return colorCircles(color: Colors.white, isSelected: isSelected);
//     } else if (color == "Black") {
//       return colorCircles(color: Colors.black, isSelected: isSelected);
//     } else {
//       return SizedBox();
//     }
//   }

//   Container colorCircles({@required Color color, bool isSelected}) {
//     return Container(
//       padding: EdgeInsets.all(2),
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//               color: isSelected ? Colors.white : Colors.transparent, width: 2)),
//       child: Container(
//         height: 20,
//         width: 20,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: color,
//         ),
//       ),
//     );
//   }
// }
