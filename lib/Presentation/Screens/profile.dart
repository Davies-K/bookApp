import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/widgets/page_title.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String title;
  const ProfilePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.SIZE_32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: AppSizes.HEIGHT_20),
        PageTitle(title: title),
        const SizedBox(height: AppSizes.HEIGHT_20),
      ]),
    ));
  }
}
