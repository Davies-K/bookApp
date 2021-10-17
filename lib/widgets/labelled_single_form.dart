import 'package:book_app/AppConfig/app_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelledSingleInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? value;
  final String keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  const LabelledSingleInput(
      {Key? key,
      required this.placeholder,
      required this.keyboardType,
      required this.controller,
      required this.obscureText,
      required this.label,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSizes.SIZE_10,
        ),
        Text(label.toUpperCase(),
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
              fontSize: 12,
              //fontWeight: FontWeight.bold,
            )),
        TextFormField(
          controller: controller,

          style: GoogleFonts.lato(fontSize: 18),
          onTap: () {},
          keyboardType: keyboardType == "text"
              ? TextInputType.text
              : TextInputType.number,
          //initialValue: initialValue,
          obscureText:
              placeholder == 'Password' || placeholder == 'Choose a password'
                  ? true
                  : false,

          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
              suffixIcon: placeholder == "Password"
                  ? InkWell(
                      onTap: () {},
                      child: Icon(
                        obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        //size: 15.0,
                      ))
                  : InkWell(
                      onTap: () {
                        controller.text = "";
                      },
                      child: Icon(FontAwesomeIcons.solidTimesCircle,
                          size: 20, color: Colors.grey[500]),
                    ),
              hintText: placeholder,
              hintStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey),
              filled: false,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              border: UnderlineInputBorder(borderSide: BorderSide())),
        ),
      ],
    );
  }
}
