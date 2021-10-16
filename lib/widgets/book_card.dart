import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Utils/app_utils.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(AppSizes.SIZE_10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.SIZE_20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100]!,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: AppSizes.HEIGHT_150,
                width: AppSizes.WIDTH_100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.SIZE_10),
                  child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/dummy_image.jpeg")),
                ),
              ),
              SizedBox(width: AppSizes.WIDTH_12),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text("by Davies Kwarteng",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: AppSizes.SIZE_12)),
                    SizedBox(height: AppSizes.HEIGHT_4),
                    Text("The more of Less",
                        style: AppUtils.getTextTheme(context)
                            .headline5
                            ?.copyWith(fontSize: AppSizes.TEXT_SIZE_18)),
                    SizedBox(height: AppSizes.HEIGHT_4),
                    Text("⭐️  4.5",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: AppSizes.SIZE_12)),
                    SizedBox(height: AppSizes.HEIGHT_4),
                    Chip(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppSizes.WIDTH_12),
                        backgroundColor: Colors.blue,
                        label: Text('Minimalism',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'lato',
                                fontSize: AppSizes.SIZE_10)))
                  ]))
            ]));
  }
}
