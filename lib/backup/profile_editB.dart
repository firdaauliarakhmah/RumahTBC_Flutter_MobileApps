// import 'dart:io';
// import 'package:capstone_proj/widget/button.dart';
// import 'package:capstone_proj/view_model/user_view_model.dart';
// import 'package:capstone_proj/widget/text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:capstone_proj/widget/circle_avatar_profile.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class EditProfileB extends StatelessWidget {
//   //ganti jd model
//   String imageURL = 'https://res.cloudinary.com/drjnb5zxa/image/upload/v1698804785/TBC/blank-profile.png';
//   double imageSize = 80;
//   double nameSize = 12;

//   EditProfileB({super.key, required this.userVM});
//   final UserViewModel userVM;
//   File? imageFile;// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;


// class ProfileEdit extends StatefulWidget {
//   final UserViewModel userVM;

//   const ProfileEdit({super.key, required this.userVM});

//   @override
//   _ProfileEditState createState() => _ProfileEditState(userVM: userVM);
// }

// class _ProfileEditState extends State<ProfileEdit> {
//   String imageURL = 'https://res.cloudinary.com/drjnb5zxa/image/upload/v1698804785/TBC/blank-profile.png';
//   double imageSize = 80;
//   double nameSize = 12;

//   _ProfileEditState({ required this.userVM});
//   final UserViewModel userVM;
//   File? imageFile;
//   String? imageUrlNew;

//   Future<void> selectProfilePicture() async {
//     final imageData = await ImagePicker().pickImage(source: ImageSource.gallery);
//     setState(() {
//       if(imageData != null) imageFile = File(imageData.path);
//     });
//   }

//   Future<void> uploadImagetoCloudinary(File? imageFile, String nik) async{
//     final url = Uri.parse('https://api.cloudinary.com/v1_1/drjnb5zxa/image/upload');

//     final request =  http.MultipartRequest('POST', url)
//                       ..fields['upload_preset'] = 'tbc_profile_upload'
//                       ..fields['public_id'] = nik
//                       ..files.add(await http.MultipartFile.fromPath('file', imageFile!.path));

//     final response = await request.send();
//     if(response.statusCode == 200){
//       final responseData = await response.stream.toBytes();
//       final responseString = String.fromCharCodes(responseData );
//       final jsonMap = jsonDecode(responseString);

//       setState(() {
//       final url = jsonMap['url'];
//       imageUrlNew = url;
//       });
//     }
                      
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = userVM.users1;
//     TextEditingController noTelp = TextEditingController(text: user.noTelp);
//     TextEditingController email = TextEditingController(text: user.email);
//     TextEditingController alamat = TextEditingController(text: user.alamat);
    
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           padding: const EdgeInsets.only(top: 20,left: 20),
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
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 5.0),

//             if(imageFile != null) ...[
//             NameProfileLocal(
//               imagePath: imageFile!, 
//               name: 'NIK: ${userVM.users1.nik}',
//               imageSize: imageSize*2,
//               nameSize: nameSize,
//               onPressed: selectProfilePicture,
//             ),
//             ]else ...[
//             NameProfile(
//                 imageURL: user.imageProfile,
//                 name: user.nik,
//                 imageSize: imageSize,
//                 nameSize: nameSize,
//                 onPressed: selectProfilePicture
//             ),
//             ],
//             Padding(
//               padding: const EdgeInsets.only(right: 40,left: 40, top: 20),
//               child: Column(
//                 children: [
//                   TittledTextField(
//                     name: 'Nama', 
//                     nameWeight: FontWeight.bold,
//                     controller: TextEditingController(text: user.name),
//                     enableTextField: false,
//                   ),

//                   TittledTextField(
//                     name: 'No. Telepon', 
//                     nameWeight: FontWeight.bold,
//                     controller: noTelp,
//                   ),

//                   TittledTextField(
//                     name: 'Email', 
//                     nameWeight: FontWeight.bold,
//                     controller: email,
//                   ),

//                   TittledTextField(
//                     name: 'Alamat', 
//                     nameWeight: FontWeight.bold,
//                     controller: alamat,
//                   ),

//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: ButtonMainFilled(
//                 text: 'Simpan', 
//                 onPressed: (){
//                   if(imageFile != null) uploadImagetoCloudinary(imageFile, user.nik);
//                   userVM.updateUser(noTelp.text, email.text, alamat.text, imageUrlNew);
//                   Navigator.pop(context);
//                 }
//               ),
//             ),
            
//             const SizedBox(height: 50)
//           ],
//         ),
//       )
//     );
//   }
// }

// // class EditProfile extends StatelessWidget {
// //   //ganti jd model
// //   String imageURL = 'https://res.cloudinary.com/drjnb5zxa/image/upload/v1698804785/TBC/blank-profile.png';
// //   double imageSize = 80;
// //   double nameSize = 12;

// //   EditProfile({super.key, required this.userVM});
// //   final UserViewModel userVM;
// //   File? imageFile;
// //   String? imageUrlNew;

// //   // const Profile({required this.user});
  

// //   @override
// //   Widget build(BuildContext context) {
// //     final user = userVM.users1!;
// //     TextEditingController noTelp = TextEditingController(text: user.noTelp);
// //     TextEditingController email = TextEditingController(text: user.email);
// //     TextEditingController alamat = TextEditingController(text: user.alamat);
    
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           padding: const EdgeInsets.only(top: 20,left: 20),
// //           icon: SvgPicture.asset(
// //             'assets/icons/arrow-back.svg',
// //             width: 40,
// //             height: 40,
// //           ),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const SizedBox(height: 5.0),

// //             NameProfile(
// //                 imageURL: user.imageProfile,
// //                 name: user.nik,
// //                 imageSize: imageSize,
// //                 nameSize: nameSize,
// //                 onPressed: (){
// //                   imageFile = userVM.selectProfilePicture as File?;
// //                 }
// //             ),

// //             Padding(
// //               padding: const EdgeInsets.only(right: 40,left: 40, top: 20),
// //               child: Column(
// //                 children: [
// //                   TittledTextField(
// //                     name: 'Nama', 
// //                     nameWeight: FontWeight.bold,
// //                     controller: TextEditingController(text: user.name),
// //                     enableTextField: false,
// //                   ),

// //                   TittledTextField(
// //                     name: 'No. Telepon', 
// //                     nameWeight: FontWeight.bold,
// //                     controller: noTelp,
// //                   ),

// //                   TittledTextField(
// //                     name: 'Email', 
// //                     nameWeight: FontWeight.bold,
// //                     controller: email,
// //                   ),

// //                   TittledTextField(
// //                     name: 'Alamat', 
// //                     nameWeight: FontWeight.bold,
// //                     controller: alamat,
// //                   ),

// //                 ],
// //               ),
// //             ),

// //             const SizedBox(height: 30),

// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 40),
// //               child: ButtonMainFilled(
// //                 text: 'Simpan', 
// //                 onPressed: (){
// //                   imageUrlNew = userVM.uploadImagetoCloudinary(imageFile, userVM.users1!.nik) as String?;
// //                   userVM.updateUser(noTelp.text, email.text, alamat.text, imageURL);
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(builder: (context) => Profile())
// //                   );
// //                 }
// //               ),
// //             ),
            
// //             const SizedBox(height: 50)
// //           ],
// //         ),
// //       )
// //     );
// //   }
// // }

//   String? imageUrlNew;

//   // const Profile({required this.user});
  

//   @override
//   Widget build(BuildContext context) {
//     final user = userVM.users1!;
//     TextEditingController noTelp = TextEditingController(text: user.noTelp);
//     TextEditingController email = TextEditingController(text: user.email);
//     TextEditingController alamat = TextEditingController(text: user.alamat);
    
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           padding: const EdgeInsets.only(top: 20,left: 20),
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
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 5.0),

//             NameProfile(
//                 imageURL: user.imageProfile,
//                 name: user.nik,
//                 imageSize: imageSize,
//                 nameSize: nameSize,
//                 onPressed: (){
//                   // imageFile = userVM.selectProfilePicture as File?;
//                 }
//             ),

//             Padding(
//               padding: const EdgeInsets.only(right: 40,left: 40, top: 20),
//               child: Column(
//                 children: [
//                   TittledTextField(
//                     name: 'Nama', 
//                     nameWeight: FontWeight.bold,
//                     controller: TextEditingController(text: user.name),
//                     enableTextField: false,
//                   ),

//                   TittledTextField(
//                     name: 'No. Telepon', 
//                     nameWeight: FontWeight.bold,
//                     controller: noTelp,
//                   ),

//                   TittledTextField(
//                     name: 'Email', 
//                     nameWeight: FontWeight.bold,
//                     controller: email,
//                   ),

//                   TittledTextField(
//                     name: 'Alamat', 
//                     nameWeight: FontWeight.bold,
//                     controller: alamat,
//                   ),

//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: ButtonMainFilled(
//                 text: 'Simpan', 
//                 onPressed: (){
//                   // imageUrlNew = userVM.uploadImagetoCloudinary(imageFile, userVM.users!.nik) as String?;
//                   // userVM.updateUser(noTelp.text, email.text, alamat.text, imageURL);
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => Profile())
//                   // );
//                 }
//               ),
//             ),
            
//             const SizedBox(height: 50)
//           ],
//         ),
//       )
//     );
//   }
// }
