import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/colors.dart';

class DropdownForm extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final void Function(dynamic)? onChange;
  final String? selectedValue;
  final List<DropdownMenuItem> items;
  
  const DropdownForm({super.key, 
    required this.items,
    this.label,
    this.onChange,
    this.controller,
    this.selectedValue, 
    });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.normal,color: Colors.black);

    return TextField(
      readOnly: true,
      controller: controller,
      decoration:  InputDecoration(
        border: InputBorder.none,
        suffixStyle: textStyle,
        suffixIcon: DropdownButtonFormField(
          value: selectedValue,
          items: items,
          onChanged: onChange,
          style: textStyle,
          decoration: InputDecoration(
            suffixStyle: textStyle,
            labelText: label,
            labelStyle: textStyle,
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
            
            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20)
          ),
        ),
      ),
    );
  }
}