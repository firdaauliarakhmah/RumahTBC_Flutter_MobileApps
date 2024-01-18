// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../widget/button.dart';
// import 'Register.dart';
// import '../home.dart';
// import 'login.dart';

// class LoginOrRegist extends StatelessWidget {
// const LoginOrRegist({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: IconButton(
//               icon: SvgPicture.asset(
//                 'assets/icons/close.svg',
//                 width: 30,
//                 height: 30,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomePage())
//                 );
//               },
//             ),
//           )
//         ]
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: Container()
//           ),

//           Container(
//             alignment: Alignment.bottomCenter,
//             padding: const EdgeInsets.only(left: 25,right: 25,bottom: 60),
//             child: Column(
//               children: [

//                 ButtonMainFilled(
//                   text: 'Masuk', 
//                   onPressed: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Login())
//                     );
//                   }
//                 ),

                  
//                 const SizedBox(height: 25),
                  
//                 ButtonSecFilled(
//                   text: 'Daftar', 
//                   onPressed: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Register())
//                     );
//                   }
//                 ),
//               ]
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }