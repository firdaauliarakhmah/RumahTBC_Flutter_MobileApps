import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameProfile extends StatelessWidget {
  final String? imageURL;
  final String name;
  final double imageSize;
  final double nameSize;
  final FontWeight nameWeight;
  final void Function()? onPressed;

  const NameProfile(
      {required this.imageURL,
      required this.name,
      required this.imageSize,
      required this.nameSize,
      this.onPressed,
      this.nameWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: CircleAvatar(
              radius: imageSize,
              backgroundImage: NetworkImage(imageURL?? ''),
            )
          ),

          const SizedBox(height: 5.0,),
          
          Text(
            name,
            style: GoogleFonts.poppins(
                fontSize: nameSize, 
                fontWeight: nameWeight),
          )
        ],
      ),
    );
  }
}

class NameProfileLocal extends StatelessWidget {
  final File imagePath;
  final String name;
  final double imageSize;
  final double nameSize;
  final FontWeight nameWeight;
  final void Function()? onPressed;

  const NameProfileLocal(
      {required this.imagePath,
      required this.name,
      required this.imageSize,
      required this.nameSize,
      this.onPressed,
      this.nameWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: ClipOval(
              // clipper:  ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100)))),
              clipBehavior: Clip.hardEdge,
              child: Image.file(
                imagePath,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.cover,
              ),
            )
          ),

          const SizedBox(height: 5.0,),
          
          Text(
            name,
            style: GoogleFonts.poppins(
                fontSize: nameSize, 
                fontWeight: nameWeight),
          )
        ],
      ),
    );
  }
}
