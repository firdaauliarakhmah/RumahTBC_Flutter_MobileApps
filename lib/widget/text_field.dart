import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/colors.dart';

class TittledTextField extends StatelessWidget {
  final String name;
  final FontWeight nameWeight;
  final bool enableTextField;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final TextInputType? keyboardType;
  
  const TittledTextField({super.key, 
    required this.name, 
    required this.nameWeight,
    this.onChange,
    this.controller,
    this.enableTextField = true,
    this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(fontSize: 13, fontWeight: nameWeight),
          ),
          const SizedBox(
            height: 5.0,
          ),
          TextField(
            keyboardType: keyboardType,
            enabled: enableTextField,
            controller: controller,
            onChanged: onChange,
            style: GoogleFonts.poppins(
              fontSize: 13, fontWeight: FontWeight.normal),
            decoration:  InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.white,
                )
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.white,
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
          )
        ],
      ),
    );
  }
}


//maxLines set to 0 to get infinite grow height
class TittledTextFieldLine extends StatelessWidget {
  final String name;
  final FontWeight nameWeight;
  final int minLines;
  final bool enableTextField;
  final TextEditingController? controller;
  final void Function(String)? onChange;

  const TittledTextFieldLine({
    required this.name, 
    required this.nameWeight,
    this.onChange,
    this.controller,
    this.minLines = 1,
    this.enableTextField = true
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 13, 
              fontWeight: nameWeight),
          ),
          const SizedBox(
            height: 5.0,
          ),
          TextField(
            onChanged: onChange,
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 13, 
                fontWeight: FontWeight.normal),
            decoration:  InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.white,
                )
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.white,
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
            maxLines: null,
            minLines: minLines,
          )
        ],
      ),
    );
  }
}

class FilledTextField extends StatelessWidget {
  final String hint;
  final String? label;
  final FontWeight nameWeight;
  final bool enableTextField;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final bool hideInput;
  final Widget? iconButton;
  final bool readOnly;
  
  const FilledTextField({super.key, 
    required this.hint, 
    required this.nameWeight,
    this.label,
    this.onChange,
    this.onTap,
    this.controller,
    this.enableTextField = true,
    this.keyboardType,
    this.hideInput = false,
    this.iconButton,
    this.readOnly = false
    });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.normal);

    return TextField(
      obscureText: hideInput,
      keyboardType: keyboardType,
      enabled: enableTextField,
      controller: controller,
      onChanged: onChange,
      onTap: onTap,
      style: textStyle,
      readOnly: readOnly,
      decoration:  InputDecoration(
        suffixIcon: iconButton,
        labelText: label,
        labelStyle: textStyle,
        hintText: hint,
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

//maxLines set to 0 to get infinite grow height
class FilledTextFieldLine extends StatelessWidget {
  final String hint;
  final String? label;
  final FontWeight nameWeight;
  final int minLines;
  final bool enableTextField;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final TextInputType? keyboardType;

  const FilledTextFieldLine({
    required this.hint, 
    required this.nameWeight,
    this.label,
    this.onChange,
    this.controller,
    this.minLines = 1,
    this.enableTextField = true,
    this.keyboardType,
    });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.normal);

    return TextField(
      // expands: expands,
      keyboardType: keyboardType                                                                               ,
      onChanged: onChange,
      controller: controller,
      style: textStyle,
      decoration:  InputDecoration(
        labelText: label,
        labelStyle: textStyle,
        hintText: hint,
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
      maxLines: null,
      minLines: minLines,
    );
  }
}