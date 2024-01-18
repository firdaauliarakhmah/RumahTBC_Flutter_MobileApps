import 'package:capstone_proj/util/colors.dart';
import 'package:capstone_proj/view/login_regist/login.dart';
import 'package:capstone_proj/view/login_regist/register2.dart';
import 'package:capstone_proj/widget/button.dart';
import 'package:capstone_proj/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nik = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  bool _isVisible1 = false;
  bool _isVisible2 = false;

  @override
  Widget build(BuildContext context){
    double circleRadius = MediaQuery.of(context).size.width/5;

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
                            controller: nik,
                            hint: "NIK", 
                            label: "NIK",
                            nameWeight: FontWeight.normal
                          ),

                          const SizedBox(height: 10),

                          FilledTextField(
                            controller: email,
                            hint: "Email",
                            label: "Email",
                            nameWeight: FontWeight.normal
                          ),

                          const SizedBox(height: 10.0),

                          FilledTextField(
                            controller: password,
                            keyboardType: TextInputType.text,
                            hint: "Password",
                            label: "Password",
                            nameWeight: FontWeight.normal,
                            hideInput: !_isVisible1,
                            iconButton: IconButton(
                              icon: Icon(_isVisible1 == true ? Icons.visibility : Icons.visibility_off),
                              onPressed: () => setState(() {
                                  _isVisible1 = !_isVisible1;
                              })
                            ),
                          ),

                          const SizedBox(height: 10.0),

                          FilledTextField(
                            controller: confirmPass,
                            keyboardType: TextInputType.text,
                            hint: "Confirm Password",
                            label: "Confirm Password",
                            nameWeight: FontWeight.normal,
                            hideInput: !_isVisible2,
                            iconButton: IconButton(
                              icon: Icon(_isVisible2 == true ? Icons.visibility : Icons.visibility_off),
                              onPressed: () => setState(() {
                                  _isVisible2 = !_isVisible2;
                              })
                            ),
                          ),

                          const SizedBox(height: 50),
                        ],
                      ),

                      Column(
                        children: [
                          ButtonMainFilled(
                            text: "Next Step",
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Register2(nik: nik.text, email: email.text, password: password.text))
                              );
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
                                onPressed: () =>
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Login())
                                  ),
                                child: Text(
                                  " Sign in",
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