import 'package:book_app/AppConfig/app_config.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWithImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onButtonPressed;
  final double? width;
  OutlinedButtonWithImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width ?? double.infinity,
        height: AppSizes.HEIGHT_60,
        child: ElevatedButton(
            onPressed: onButtonPressed,
            style: ButtonStyles.imageRounded,
            child: Center(
              child: Container(
                width: 30,
                height: 30,
                child: ClipOval(
                  child: Image(
                      fit: BoxFit.contain, image: AssetImage(this.imageUrl)),
                ),
              ),
            )));
  }
}
