import 'package:flutter/material.dart';
import '../../util/colors.dart';
import '../../widget/button.dart';
import 'login.dart';
import 'register.dart';

class GetStarted extends StatelessWidget {
const GetStarted({ Key? key }) : super(key: key);

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
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              // Expanded(
              //     child: Container()
              // ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/image/get_started.png',
                  // scale: 0.8,
                ),
              ),
              
              Expanded(
                  child: Container()
              ),

              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 60),
                child: Column(
                  children: [

                    ButtonMainFilled(
                      text: 'Get Started', 
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register())
                        );
                      }
                    ),
                  ]
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}