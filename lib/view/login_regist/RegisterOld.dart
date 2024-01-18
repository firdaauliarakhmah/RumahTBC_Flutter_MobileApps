// import 'package:capstone_proj/widget/button.dart';
// import 'package:capstone_proj/widget/text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Register extends StatefulWidget {
//   const Register({ Key? key }) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Register> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           padding: const EdgeInsets.only(top: 10,left: 20,bottom: 10),
//           icon: SvgPicture.asset(
//             'assets/icons/arrow-back.svg',
//             width: 40,
//             height: 40,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
            
//             Text(
//               "Daftar",
//               style: GoogleFonts.poppins(
//                 fontSize: 40,
//                 fontWeight: FontWeight.w600
//               ),
//             ),

//             const SizedBox(height: 30.0),

//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TittledTextField(
//                     name: "NIK", 
//                     nameWeight: FontWeight.normal
//                   ),
                  
//                   TittledTextField(
//                     name: "Nama", 
//                     nameWeight: FontWeight.normal
//                   ),

//                   const SizedBox(height: 10),

//                   TittledTextField(
//                     name: "Nama", 
//                     nameWeight: FontWeight.normal
//                   ),

//                   const SizedBox(
//                     height: 10.0,
//                   ),

//                   TittledTextField(
//                     name: "Email",
//                     nameWeight: FontWeight.normal
//                   ),

//                   const SizedBox(
//                   height: 10.0,
//                   ),

//                   TittledTextField(
//                     name: "Password",
//                     nameWeight: FontWeight.normal
//                   ),

//                   const SizedBox(
//                   height: 10.0,
//                   ),

//                   TittledTextField(
//                     name: "Nomor Telepon",
//                     nameWeight: FontWeight.normal
//                   ),

//                   const SizedBox(
//                   height: 10.0,
//                   ),

//                   TittledTextFieldLine(
//                     name: "Alamat", 
//                     nameWeight: FontWeight.normal, 
//                   ),

//                   const SizedBox(height: 50),

//                   ButtonMainFilled(
//                     text: "Daftar",
//                     onPressed: (){}
//                   ),

//                   const SizedBox(height: 70)
//                 ],
//               ),
//             )
//           ],
//         ),
//       )
//     );
//   }
// }

