import 'package:book_app/AppConfig/app_config.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final int itemIndex;
  final String label;
  final ValueNotifier<int> notifier;
  const BottomNavigationItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.itemIndex,
      required this.notifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: AppSizes.SIZE_16,
      onPressed: () {
        notifier.value = itemIndex;
      },
      child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (BuildContext context, _, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icon,
                    size: AppSizes.SIZE_20,
                    color: notifier.value == itemIndex
                        ? AppColors.primaryColor
                        : Colors.grey),
                SizedBox(width: AppSizes.WIDTH_4),
                Text(label,
                    style: TextStyle(
                        color: notifier.value == itemIndex
                            ? AppColors.primaryColor
                            : Colors.grey))
              ],
            );
          }),
    );
  }
}
