import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/colors.dart';


//Main Button with full width 
class ButtonMainFilled extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Size btnSize;
  final double fontSize;
  final FontWeight fontWeight;
  final Color btnColor;
  final Color fontColor;
  final double roundCorner;

  const ButtonMainFilled({
    required this.text, 
    required this.onPressed,
    this.btnSize = const Size(double.infinity, 50),
    this.fontSize = 19,
    this.fontWeight = FontWeight.bold,
    this.btnColor = CustomColors.mainButton,
    this.fontColor = Colors.white,
    this.roundCorner = 15
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: btnSize,
        backgroundColor: btnColor,
        foregroundColor: fontColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(roundCorner)),
        textStyle: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: fontWeight,
          )
      ),
      
      child: Text(text),
    );
  }
}


//Secondary Button with full width
class ButtonSecFilled extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Size btnSize;
  final double fontSize;
  final FontWeight fontWeight;
  final Color btnColor;
  final Color fontColor;
  final double roundCorner;

  const ButtonSecFilled({
    required this.text, 
    required this.onPressed,
    this.btnSize = const Size(double.infinity, 50),
    this.fontSize = 19,
    this.fontWeight = FontWeight.w600,
    this.btnColor = CustomColors.secButton,
    this.fontColor = CustomColors.secButtonText,
    this.roundCorner = 15
    });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: btnSize,
        foregroundColor: fontColor,
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(roundCorner)),
        textStyle: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
      child: Text(text),
    );
  }
}

//Secondary Button with full width
class ButtonSecOutline extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color borderColor;

  const ButtonSecOutline({
    required this.text, 
    required this.onPressed,
    this.textColor = CustomColors.secButtonText,
    this.borderColor = CustomColors.outlineColorButton});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: CustomColors.secButtonText,
        minimumSize: const Size(double.infinity, 50),
        textStyle: GoogleFonts.poppins(
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
        side: BorderSide(color: borderColor)
      ),
      child: Text(text),
    );
  }
}


//Icon Button
class ButtonIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final Color iconColor;
  final double iconSize;

  const ButtonIcon({
    required this.iconData,
    required this.onPressed,
    this.iconColor = Colors.black,
    this.iconSize = 25});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: iconColor,
        size: iconSize)
    );
  }
}


//Icon Button with text bellow
class ButtonIconText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onPressed;
  final Color iconColor;
  final double iconSize;
  final double textSize;

  const ButtonIconText({
    required this.iconData,
    required this.text, 
    required this.onPressed,
    this.iconColor = Colors.black,
    this.iconSize = 25,
    this.textSize = 12
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: iconSize + 10,
        width: iconSize + 10,
        color: Colors.blueGrey[200],
        child: Column(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: iconSize,
            ),

            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: textSize,
                fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
      )
    );
  }
}


//icon SVG
class ButtonIconTextSVG extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onPressed;
  final Color iconColor;
  final Color fontColor;
  // final double iconWidth;
  final double iconHeight;
  final double textSize;
  final double space;
  final Color backgroundColor;

  const ButtonIconTextSVG({
    required this.iconPath,
    required this.text, 
    required this.onPressed,
    required this.backgroundColor,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
    // this.iconWidth = 25,
    this.iconHeight = 25,
    this.textSize = 12,
    this.space = 0.0
    });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onPressed,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                color: backgroundColor,
                // height: iconHeight + textSize + 10,
                // width: iconHeight + textSize + 10,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    iconPath,
                    height: iconHeight,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  )
                )
              )
            ),

            SizedBox(height: space),

            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: textSize,
                fontWeight: FontWeight.normal,
                color: fontColor,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      
    );
  }
}




class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;

  CustomButton({required this.text, required this.onPressed, ButtonStyle? buttonStyle,})
      : this.buttonStyle = buttonStyle ?? ElevatedButton.styleFrom(
        textStyle: GoogleFonts.poppins(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        minimumSize: Size(double.infinity, 40)
      ).merge(buttonStyle); // Style default

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle, // Menggunakan style default atau style khusus jika diberikan
      child: Text(text),
    );
  }
}












// class ButtonIconText extends StatelessWidget {
//   final IconData iconData;
//   final String text;
//   final VoidCallback onPressed;
//   final Color iconColor;
//   final double iconSize;
//   final double textSize;

//   const ButtonIconText({
//     required this.iconData,
//     required this.text, 
//     required this.onPressed,
//     this.iconColor = Colors.black,
//     this.iconSize = 25,
//     this.textSize = 12
//     });

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: onPressed,
//       style: TextButton.styleFrom(
//         padding: const EdgeInsets.all(10),
//         minimumSize: Size(0,iconSize + 10),
//       ),
//       child: Column(
//         children: [
//           Icon(
//             iconData,
//             color: iconColor,
//             size: iconSize,
//           ),

//           Text(
//             text,
//             style: GoogleFonts.poppins(
//               fontSize: textSize,
//               fontWeight: FontWeight.normal
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }