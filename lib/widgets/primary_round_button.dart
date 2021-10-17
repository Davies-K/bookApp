import 'package:book_app/AppConfig/app_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryRoundButton extends StatelessWidget {
  final VoidCallback? onButtonPressed;
  final String Label;
  final IconData icon;
  const PrimaryRoundButton(
      {Key? key, this.onButtonPressed, required this.Label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes.HEIGHT_60,
      child: ElevatedButton(
          onPressed: onButtonPressed,
          style: ButtonStyles.blueRounded,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              Text(Label,
                  style: GoogleFonts.lato(fontSize: 20, color: Colors.white)),
            ],
          )),
    );
  }
}
