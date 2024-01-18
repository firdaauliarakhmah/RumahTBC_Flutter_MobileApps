import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../data/model/user_data.dart';
import '../../view_model/user_view_model.dart';
import '../../widget/button.dart';
import '../../widget/circle_avatar_profile.dart';
import '../../widget/text_field.dart';
import '../home.dart';


class ProfileEdit extends StatefulWidget {
  final UserData userData;

  const ProfileEdit({required this.userData});

  @override
  _ProfileEditState createState() => _ProfileEditState(user: userData);
}

class _ProfileEditState extends State<ProfileEdit> {
  double imageSize = 80;
  double nameSize = 12;

  _ProfileEditState({required this.user});
  final UserData user;
  File? imageFile;

  Future<void> selectProfilePicture() async {
    final imageData = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if(imageData != null) imageFile = File(imageData.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userVM = Provider.of<UserViewModel>(context);

    TextEditingController noTelp = TextEditingController(text: user.noTelp);
    TextEditingController email = TextEditingController(text: user.email);
    TextEditingController alamat = TextEditingController(text: user.alamat);
    TextEditingController name = TextEditingController(text: user.name);
    TextEditingController date = TextEditingController(text: user.tanggalLahir);
    TextEditingController jk = TextEditingController(text: user.jk == 'L' ? 'Laki-laki' : 'Perempuan');

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(),
        ),
        leading: IconButton(
          // padding: const EdgeInsets.only(top: 20,left: 20),
          icon: SvgPicture.asset(
            'assets/icons/arrow-back.svg',
            // width: 40,
            // height: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            if(imageFile != null) ...[
            NameProfileLocal(
              imagePath: imageFile!, 
              name: 'NIK: ${user.nik}',
              imageSize: imageSize*2,
              nameSize: nameSize,
              onPressed: selectProfilePicture,
            ),
            ]else ...[
            NameProfile(
                imageURL: user.imageProfile,
                name: 'Nik: ${user.nik.toString()}',
                imageSize: imageSize,
                nameSize: nameSize,
                onPressed: selectProfilePicture
            ),
            ],
            Padding(
              padding: const EdgeInsets.only(right: 40,left: 40, top: 20),
              child: Column(
                children: [
                  TittledTextField(
                    name: 'Nama', 
                    nameWeight: FontWeight.bold,
                    controller: name,
                    enableTextField: false,
                  ),

                  TittledTextField(
                    name: 'Tanggal Lahir', 
                    nameWeight: FontWeight.bold,
                    controller: date,
                    enableTextField: false,
                  ),

                  TittledTextField(
                    name: 'Jenis Kelamin', 
                    nameWeight: FontWeight.bold,
                    controller: jk,
                    enableTextField: false,
                  ),

                  TittledTextField(
                    name: 'No. Telepon', 
                    nameWeight: FontWeight.bold,
                    controller: noTelp,
                    keyboardType: TextInputType.number,
                  ),

                  TittledTextField(
                    name: 'Email', 
                    nameWeight: FontWeight.bold,
                    controller: email,
                    enableTextField: false,
                  ),

                  TittledTextFieldLine(
                    name: 'Alamat', 
                    nameWeight: FontWeight.bold,
                    controller: alamat,
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ButtonMainFilled(
                text: 'Simpan', 
                onPressed: () async {
                  if(imageFile != null){
                    // var formData = FormData.fromMap({
                    //   'profileImg': await MultipartFile.fromFile(imageFile!.path)
                    // });

                    Map<String,dynamic> req = {
                      "no_hp": noTelp.text,
                      "alamat" : alamat.text,
                      "gambar": await MultipartFile.fromFile(imageFile!.path)
                    };
                    
                    int nik = int.parse(user.nik!);
                    await userVM.updateUser(req,nik);
                  }else{
                    Map<String,dynamic> req = {
                      "no_hp": noTelp.text,
                      "alamat" : alamat.text,
                    };

                    int nik = int.parse(user.nik!);
                    await userVM.updateUser(req, nik);
                  }
                  
                  
                  

                  // int nik = int.parse(user.nik!);
                  // userVM.updateUser(req, nik);
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomePage())
                  // );
                  await userVM.fetchUser();
                  Navigator.pop(context, MaterialPageRoute(builder: (context) => HomePage()));
                }
              ),
            ),
            
            const SizedBox(height: 50)
          ],
        ),
      )
    );
  }
}
