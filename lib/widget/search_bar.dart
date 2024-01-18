import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/colors.dart';

class SearchBarCust extends StatelessWidget {
  final String name;
  final FontWeight nameWeight;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  
  const SearchBarCust({super.key, 
    required this.name, 
    required this.nameWeight,
    required this.onChange,
    this.controller,
    });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.normal);

    return TextField(
      controller: controller,
      onChanged: onChange,
      style: textStyle,
      decoration:  InputDecoration(
        // prefixIcon: SvgPicture.asset(
        //   'assets/icons/search.svg',
        //   width: 0.1,
        //   height: 0.1,
        // ),
        prefixIcon: const Icon(Icons.search_rounded, color: CustomColors.activeIcon,),
        hintText: name,
        labelText: name,
        labelStyle: textStyle,
        hintStyle: textStyle,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.white
          )
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.white
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            width: 1.5,
            color: CustomColors.textFieldBorder
          )
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20)),
    );
  }
}