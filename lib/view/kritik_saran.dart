import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../view_model/user_view_model.dart';
import '../widget/button.dart';
import '../widget/text_field.dart';
import 'home.dart';

class KritikSaran extends StatelessWidget {
  KritikSaran({ Key? key }) : super(key: key);

  final TextEditingController nama = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController kritikSaran = TextEditingController();

  @override
  Widget build(BuildContext context){
    final userVM = Provider.of<UserViewModel>(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Kritik dan Saran',
          style: GoogleFonts.poppins(),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow-back.svg',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 20),

              FilledTextField(
                controller: nama,
                hint: "Nama Lengkap",
                nameWeight: FontWeight.normal,
                keyboardType: TextInputType.name,
              ),

              const SizedBox(height: 10),

              FilledTextField(
                controller: email,
                hint: "Email",
                nameWeight: FontWeight.normal,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 10),

              // SizedBox(
              //   height: 200,
              //   child: FilledTextFieldLine(
              //     expands: true,
              //     controller: kritikSaran,
              //     hint: "Berikan kritik atau saran anda", 
              //     nameWeight: FontWeight.normal,
              //     keyboardType: TextInputType.multiline,
              //   ),
              // ),
              FilledTextFieldLine(
                minLines: 5,
                controller: kritikSaran,
                hint: "Berikan kritik atau saran anda", 
                nameWeight: FontWeight.normal,
                keyboardType: TextInputType.multiline,
              ),

              const SizedBox(height: 20),

              ButtonMainFilled(
                text: "Submit",
                onPressed: () async{
                  Map<String, dynamic> req = {
                    "name": nama.text,
                    "email": email.text,
                    "message": kritikSaran.text
                  };

                  await userVM.kritikSaran(req);

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context, MaterialPageRoute(builder: (context) => HomePage()));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}