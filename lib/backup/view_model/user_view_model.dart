// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:capstone_proj/data/model/user.dart';
// import 'package:capstone_proj/data/service/api_service.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UserViewModel extends ChangeNotifier {
//   final ApiService apiService = ApiService();
  
//   User? users;
//   User? get user => users;
//   bool _isLoggedIn = false;
//   bool get isLoggedIn => _isLoggedIn;

//   // String nik = '0000000000000000';
//   // String name = 'Seol Beom';
//   // String noTelp = '092132123212';
//   // String alamat = 'Seoul';
//   User users1 = User(nik: '0000000000000001', name: 'Seol Beom', noTelp: '092139485736', email: 'email@gmail.com', alamat: 'Seoul',imageProfile: 'https://res.cloudinary.com/drjnb5zxa/image/upload/v1699709242/TBC/user_profile/0000000000000000.jpg');
  

//   void loadUser() {
//     //get from api
//     notifyListeners();
//   }

//    Future<void> getUserById(String userId) async{
//     try{
//       final user = await apiService.getUserById(userId);
//     }catch(e){
//       print(e);
//     }
//   }

//   void updateUser(String? noTelp, String? email, String? alamat, String? imageURL){
//     if(noTelp != null) users1.noTelp = noTelp;
//     if(email != null) users1.email = email;
//     if(alamat != null) users1.alamat = alamat;
//     if(imageURL != null) users1.imageProfile = imageURL;
//     // users1?.noTelp = noTelp!;
//     // users1.email = email!;
//     // users1?.alamat = alamat!;
//     // users1?.imageProfile = imageURL!;
//   }

//   // Future<File?> selectProfilePicture() async {
//   //   final imageData = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   if(imageData != null){
//   //     File imageFile = File(imageData.path);
//   //     return imageFile;
//   //   }else{
//   //     return null;
//   //   }


//   //   // if(image != null){
//   //   //   userVM.updateUser(noTelp, email, alamat, imageURL)
//   //   // }
//   // }

//   // Future<String?> uploadImagetoCloudinary(File? imageFile, String nik) async{
//   //   final url = Uri.parse('https://api.cloudinary.com/v1_1/drjnb5zxa/image/upload');

//   //   final request =  http.MultipartRequest('POST', url)
//   //                     ..fields['upload_preset'] = 'tbc_profile_upload'
//   //                     ..fields['public_id'] = nik
//   //                     ..files.add(await http.MultipartFile.fromPath('file', imageFile!.path));

//   //   final response = await request.send();
//   //   if(response.statusCode == 200){
//   //     final responseData = await response.stream.toBytes();
//   //     final responseString = String.fromCharCode(responseData as int);
//   //     final jsonMap = jsonDecode(responseString);

//   //     final url = jsonMap('url');
//   //     String imageUrl = url;

//   //     return imageUrl;
//   //   }
//   //   return null;
                      
//   // }

//   void login(){
//     //logic setelah login berhasil
//     _isLoggedIn = true;
//     notifyListeners();
//   }

//   void logout(){
//     //logic setelah logout
//     _isLoggedIn = false;
//     notifyListeners();
//   }
// }
