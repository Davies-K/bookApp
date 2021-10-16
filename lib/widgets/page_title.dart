import 'package:book_app/Utils/app_utils.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: AppUtils.getTextTheme(context).headline5?.copyWith());
  }
}
