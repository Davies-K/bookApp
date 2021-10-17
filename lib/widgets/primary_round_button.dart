import 'package:book_app/AppConfig/app_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryRoundButton extends StatelessWidget {
  final onButtonPressed;
  final double? width;
  final Color color;
  final String label;
  final IconData icon;
  const PrimaryRoundButton(
      {Key? key,
      this.onButtonPressed,
      required this.color,
      required this.label,
      required this.icon,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: AppSizes.HEIGHT_60,
      // decoration: BoxDecoration(
      //     color: Color(0x246CFE), borderRadius: BorderRadius.circular(50)),
      child: ElevatedButton(
          onPressed: onButtonPressed,
          style: ButtonStyles.getButtonRounded(color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              Text(label,
                  style: GoogleFonts.lato(fontSize: 20, color: Colors.white)),
            ],
          )),
    );
  }
}
