import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/colors.dart';

class TitleContentText extends StatelessWidget {
  final String title;
  final String content;
  final double titleSize;
  final double contentSize;

  const TitleContentText(
      {required this.title,
      required this.content,
      this.titleSize = 15,
      this.contentSize = 13});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: titleSize, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Text(
            content,
            style: GoogleFonts.poppins(
                fontSize: contentSize, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class TitleTextIcon extends StatelessWidget {
  final String iconSVGPath;
  final String title;
  final String content;
  final double titleSize;
  final double contentSize;
  final FontWeight titleWeight;
  final FontWeight contentWeight;
  final Color iconColor;
  final Color titleColor;
  final Color contentColor;

const TitleTextIcon({
  required this.iconSVGPath,
  required this.title,
  required this.content,
  required this.iconColor,
  this.titleSize = 15,
  this.contentSize = 14,
  this.titleWeight = FontWeight.w600,
  this.contentWeight = FontWeight.normal,
  this.titleColor = CustomColors.titleTextIcon,
  this.contentColor = CustomColors.contentTextIcon
});

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        SvgPicture.asset(
          iconSVGPath,
          width: 25,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),

        const SizedBox(width: 5),

        Expanded(
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: titleSize, 
                    fontWeight: titleWeight),
              ),
              
              Text(
                content,
                style: GoogleFonts.poppins(
                    fontSize: contentSize, 
                    fontWeight: contentWeight),
              ),
            ],
          ),
        )
      ],
    );
  }
}
