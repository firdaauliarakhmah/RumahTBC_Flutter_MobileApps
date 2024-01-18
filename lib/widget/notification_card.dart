// import 'package:capstone_proj/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NotificationCard extends StatelessWidget {
//   final String title;
//   final String content;
//   final String date;
//   final VoidCallback onPressed;
//   final double titleSize;
//   final double contentSize;

//   const NotificationCard(
//       {required this.title,
//       required this.content,
//       required this.date,
//       required this.onPressed,
//       this.titleSize = 18.0,
//       this.contentSize = 12.0});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//         child: Container(
//           padding: const EdgeInsets.only(top: 10, bottom: 10,right: 25,left: 25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                     title,
//                     style: GoogleFonts.poppins(
//                         fontSize: titleSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),

//                   const SizedBox(height: 2.0),

//                   Text(
//                     content,
//                     textAlign: TextAlign.justify,
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                     style: GoogleFonts.poppins(
//                         fontSize: contentSize,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black),
//                   ),

//                   const SizedBox(height: 8.0),

//                   Text(
//                     date,
//                     style: GoogleFonts.poppins(
//                         fontSize: contentSize,
//                         fontWeight: FontWeight.w500,
//                         color: CustomColors.inactiveIcon),
//                   ),
//             ],
//           ),
//         ),
//     );
//   }
// }
