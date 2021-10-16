import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SearchBox extends StatelessWidget {
  final String placeholder;
  final Function(String) onChanged;
  final TextEditingController? controller;
  const SearchBox({
    Key? key,
    required this.placeholder,
    required this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppUtils.getTextTheme(context).headline6,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizes.SIZE_48),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.SIZE_20,
          vertical: 15,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: AppSizes.SIZE_10),
          child: Icon(FeatherIcons.search, color: AppColors.primaryText),
        ),
        suffixIcon: InkWell(
          onTap: () {
            controller!.text = "";
          },
          child: Icon(FeatherIcons.stopCircle,
              color: AppColors.primaryText, size: 20),
        ),
        hintText: placeholder,
        hintStyle: AppUtils.getTextTheme(context).bodyText2,
        filled: true,
        fillColor: AppColors.grey,
      ),
    );
  }
}
