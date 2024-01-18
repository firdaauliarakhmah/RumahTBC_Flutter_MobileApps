// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// import '../../data/model/user.dart';
// import '../../view_model/user_view_model.dart';
// import '../../widget/button.dart';
// import '../../widget/circle_avatar_profile.dart';
// import '../../widget/text_box.dart';
// import 'profile_edit.dart';

// class Profile extends StatefulWidget {
//   const Profile({ Key? key }) : super(key: key);

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   void initState(){
//     super.initState();

//     final userViewModel = Provider.of<UserViewModel>(context,listen: false);
//     userViewModel.fetchUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String imageURL = 'https://res.cloudinary.com/drjnb5zxa/image/upload/v1698804785/TBC/blank-profile.png';
//     // String name = '3298238475938273';
//     double imageSize = 80;
//     double nameSize = 12;

//     // final userVM = Provider.of<UserViewModel>(context);

//     UserData a = UserData(
//       nik: "0928410293848192", 
//       name: "Sumanto Hara hara", 
//       noTelp: "092839473812", 
//       email: "sumanto@gmail.com", 
//       alamat: "Jalan jalan di pasar, Tegal Utara, Jawa Utara", 
//       imageProfile: imageURL, 
//       jk: "L", 
//       tanggalLahir: "2003-12-12"
//     );

//     double circleRadius = MediaQuery.of(context).size.width/5;

//     final circle = Container(
//             height: circleRadius * 2,
//             width: circleRadius * 2,
//             decoration: const ShapeDecoration(
//               shape: CircleBorder(),
//               color: Color.fromARGB(100, 48, 174, 98),
//             ),
//           );
    
//     return Scaffold(
//       body: Consumer<UserViewModel>(
//         builder: (context, userViewModel, _){
//           final userV = Provider.of<UserViewModel>(context);
//           final user = userV.user;

//           return SingleChildScrollView(
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: SizedBox(
//                     width: circleRadius * 2,
//                     height: circleRadius * 1.5,
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: -circleRadius * .5,
//                           right: -circleRadius,
//                           child: circle,
//                         ),
//                         Positioned(
//                           top: -circleRadius,
//                           child: circle,
//                         ),
//                         // circle
//                       ],
//                     ),
//                   ),
//                 ),

//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [

//                     const SizedBox(height: 20),

//                     Align(
//                       alignment: Alignment.topRight,
//                       child: IconButton(
//                         padding: const EdgeInsets.only(right: 25),
//                         icon: SvgPicture.asset(
//                           'assets/icons/edit.svg',
//                           width: 25,
//                           height: 25,
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => ProfileEdit(userData: user!))
//                           );
//                         },
//                       ),
//                     ),

//                     NameProfile(
//                         imageURL: 'https://res.cloudinary.com/drjnb5zxa/image/upload/v1698804785/TBC/blank-profile.png',
//                         name: 'NIK: ${user?.nik?? 'N/A'}',
//                         imageSize: imageSize,
//                         nameSize: nameSize
//                     ),

//                     const SizedBox(height: 20),

//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 TitleContentText(
//                                   title: 'Nama',
//                                   content: user?.name?? 'N/A',
//                                   titleSize: 13,
//                                   contentSize: 16,
//                                 ),

//                                 TitleContentText(
//                                   title: 'Tanggal Lahir',
//                                   content: user?.tanggalLahir?? 'N/A',
//                                   titleSize: 13,
//                                   contentSize: 16,
//                                 ),

//                                 TitleContentText(
//                                   title: 'Jenis Kelamin',
//                                   content: user?.jk == 'L' ? 'Laki-laki' : 'Perempuan',
//                                   titleSize: 13,
//                                   contentSize: 16,
//                                 ),

//                                 TitleContentText(
//                                   title: 'No. Telepon',
//                                   content: user?.noTelp?? 'N/A',
//                                   titleSize: 13,
//                                   contentSize: 16,
//                                 ),

//                                 TitleContentText(
//                                   title: 'Email',
//                                   content: user?.email?? 'N/A',
//                                   titleSize: 13,
//                                   contentSize: 16,
//                                 ),

//                                 TitleContentText(
//                                   title: 'Alamat',
//                                   content: user?.alamat?? 'N/A',
//                                   titleSize: 13,
//                                   contentSize: 16,
//                                 ),
//                               ],
//                             ),
                          
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 50),

//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: ButtonSecOutline(
//                         text: 'Logout',
//                         borderColor: Colors.red,
//                         onPressed: (){
                          
//                         },
//                       )
//                     ),
                    
//                     const SizedBox(height: 50)
//                   ],
//                 ),
//               ],
//             )
//           );
//         }
//       )
//     );
//   }
// }