import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../view_model/user_view_model.dart';
import '../../widget/button.dart';
import '../../widget/dropdown_form_field.dart';
import '../../widget/text_field.dart';
import '../home.dart';
import 'login.dart';


class Register2 extends StatefulWidget {
  String nik;
  String email;
  String password;

  Register2({
    required this.nik,
    required this.email,
    required this.password
  });

  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
final TextEditingController nama = TextEditingController();
  final TextEditingController tanggalLahir = TextEditingController();
  final TextEditingController jk = TextEditingController();
  final TextEditingController notelp = TextEditingController();
  final TextEditingController alamat = TextEditingController();
  String date = '';
  String selectedValue = '';
  List<DropdownMenuItem<String>> gender = [
    const DropdownMenuItem<String>(
      value: '', 
      child: Text('Choose your gender')
    ),
    const DropdownMenuItem<String>(
      value: 'lakilaki', 
      child: Text('Laki-laki')
    ),
    const DropdownMenuItem<String>(
      value: 'perempuan', 
      child: Text('Perempuan')
    ),
  ];

  Future<void> selectBirthDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime.now()
    );

    if (pickedDate != null) {
      date = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        tanggalLahir.text = date;
      });
    }
  }

  @override
  void initState(){
    selectedValue = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final userVM = Provider.of<UserViewModel>(context);
    double circleRadius = MediaQuery.of(context).size.width/5;
    // selectedValue = 'Choose your gender';
    String dropdownValue = 'Dog';

    final circle = Container(
            height: circleRadius * 2,
            width: circleRadius * 2,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Color.fromARGB(100, 48, 174, 98),
            ),
          );

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
                width: circleRadius * 2,
                height: circleRadius * 1.5,
                child: Stack(
                  children: [
                    Positioned(
                      top: -circleRadius * .5,
                      left: -circleRadius,
                      child: circle,
                    ),
                    Positioned(
                      top: -circleRadius,
                      child: circle,
                    ),
                    // circle
                  ],
                ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/8),
                
                Text(
                  "Welcome Onboard",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 50),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FilledTextField(
                            controller: nama,
                            hint: "Enter your Name", 
                            nameWeight: FontWeight.normal,
                            keyboardType: TextInputType.name,
                          ),

                          const SizedBox(height: 10.0,),

                          FilledTextField(
                            controller: tanggalLahir,
                            hint: "Pick your Tanggal Lahir",
                            nameWeight: FontWeight.normal,
                            readOnly: true,
                            onTap: () async => selectBirthDate()
                          ),

                          const SizedBox(height: 10),

                          DropdownForm(
                            selectedValue: selectedValue,
                            items: gender, 
                            onChange: (newValue) {
                              setState(() {
                                selectedValue = newValue as String;
                              });
                            }
                          ),

                          const SizedBox(height: 10.0,),

                          FilledTextField(
                            controller: notelp,
                            hint: "Enter your Phone",
                            nameWeight: FontWeight.normal,
                            keyboardType: TextInputType.number,
                          ),

                          const SizedBox(height: 10.0,),

                          FilledTextFieldLine(
                            controller: alamat,
                            hint: "Enter your Address", 
                            nameWeight: FontWeight.normal,
                            keyboardType: TextInputType.emailAddress, 
                          ),

                          const SizedBox(height: 50),

                        ],
                      ),

                      Column(
                        children: [
                          ButtonMainFilled(
                            text: "Register",
                            onPressed: () async{
                              Map<String,dynamic> req = {
                                "nik": widget.nik,
                                "email": widget.email,
                                "password": widget.password,
                                "nama_lengkap": nama.text,
                                "no_hp": notelp.text,
                                "jenis_kelamin": selectedValue,
                                "tanggal_lahir": date,
                                "alamat": alamat.text
                              };

                              Map<String,dynamic> req1 = {
                                "email": widget.email,
                                "password": widget.password,
                              };

                              await userVM.regist(req);
                              await userVM.login(req1);
                              if(userVM.isLoggedIn){
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage())
                                );
                              }
                            }
                          ),

                          const SizedBox(height: 5),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal
                                ),
                              ),

                              TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Login())
                                  );
                                },
                                child: Text(
                                  "Sign in",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: const Color.fromARGB(255, 48, 174, 98)
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ),

                const SizedBox(height: 70)
              ],
            ),
          ],
        ),
      )
    );
  }
}

