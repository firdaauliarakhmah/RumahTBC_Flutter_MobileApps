// import 'package:capstone_proj/view/profile_edit.dart';
// import 'package:capstone_proj/widget/button.dart';
// import 'package:capstone_proj/view_model/user_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:capstone_proj/widget/circle_avatar_profile.dart';
// import 'package:capstone_proj/widget/text_box.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// class Profile extends StatelessWidget {
//   //ganti jd model
//   String imageURL = 'https://res.cloudinary.com/drjnb5zxa/image/upload/v1698804785/TBC/blank-profile.png';
//   // String name = '3298238475938273';
//   double imageSize = 80;
//   double nameSize = 12;

//   // Profile();

//   @override
//   Widget build(BuildContext context) {
//     final userVM = Provider.of<UserViewModel>(context);
    
//     return Scaffold(
//       appBar: AppBar(actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 20),
//           child: IconButton(
//             icon: SvgPicture.asset(
//               'assets/icons/edit.svg',
//               width: 25,
//               height: 25,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProfileEdit(userVM: userVM))
//               );
//             }, //pindah ke page edit profile
//           ),
//         )
//       ]),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 5.0),

//             NameProfile(
//                 imageURL: userVM.users1!.imageProfile,
//                 name: 'NIK: ${userVM.users1.nik}',
//                 imageSize: imageSize,
//                 nameSize: nameSize
//             ),

//             Padding(
//               padding: const EdgeInsets.only(right: 40,left: 40, top: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TitleContentText(
//                     title: 'Nama',
//                     content: userVM.users1!.name,
//                     titleSize: 13,
//                     contentSize: 16,
//                   ),

//                   TitleContentText(
//                     title: 'No. Telepon',
//                     content: userVM.users1!.noTelp,
//                     titleSize: 13,
//                     contentSize: 16,
//                   ),

//                   TitleContentText(
//                     title: 'Email',
//                     content: userVM.users1!.email,
//                     titleSize: 13,
//                     contentSize: 16,
//                   ),

//                   TitleContentText(
//                     title: 'Alamat',
//                     content: userVM.users1!.alamat,
//                     titleSize: 13,
//                     contentSize: 16,
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 50),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: ButtonSecOutline(
//                 text: 'Logout',
//                 borderColor: Colors.red,
//                 onPressed: (){
                  
//                 },
//               )
//             ),
            
//             const SizedBox(height: 50)
//           ],
//         ),
//       )
//     );
//   }
// }
