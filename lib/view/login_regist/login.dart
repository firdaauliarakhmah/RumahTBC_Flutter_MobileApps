import 'package:capstone_proj/view/login_regist/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/user_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text_field.dart';
import '../home.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final userVM = Provider.of<UserViewModel>(context);
    double circleRadius = MediaQuery.of(context).size.width/5;

    final circle = Container(
            height: circleRadius * 2,
            width: circleRadius * 2,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Color.fromARGB(100, 48, 174, 98),
            ),
          );
    return WillPopScope(
      onWillPop: () async{
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: 
        //       Text('Anda belum login'),
        //       backgroundColor: Colors.red,
        //   )
        // );
        return false;
      },
      child: Scaffold(
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
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/8),
                  
                  Text(
                    "Welcome back!",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  // Show CircularProgressIndicator while loading
                if (userVM.loading) const CircularProgressIndicator(),
                // Show error message if login fails
                if (!userVM.loading && userVM.loginError != null)
                  Text(
                    userVM.loginError!,
                    style: const TextStyle(color: Colors.red),
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/image/login.png',
                      // scale: 0.8,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FilledTextField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          hint: "Email", 
                          nameWeight: FontWeight.normal
                        ),

                        const SizedBox(
                          height: 10.0,
                        ),

                        FilledTextField(
                          controller: password,
                          keyboardType: TextInputType.text,
                          hint: "Password",
                          nameWeight: FontWeight.normal,
                          hideInput: !_isVisible,
                          iconButton: IconButton(
                            icon: Icon(_isVisible == true ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => setState(() {
                                _isVisible = !_isVisible;
                            })
                          ),
                        ),

                        const SizedBox(height: 50),

                        Column(
                          children: [
                            ButtonMainFilled(
                              text: "Login",
                              onPressed: ()async{
                                Map<String,dynamic> req = {
                                  "email": email.text,
                                  "password": password.text
                                };
                                await userVM.login(req);
                                if(userVM.isLoggedIn){
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage())
                                  );
                                }

                              }
                            ),

                            const SizedBox(height: 5.0),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal
                                  ),
                                ),

                                TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Register())
                                    );
                                  },
                                  child: Text(
                                    " Sign up",
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        )
      )
    );
  }
}