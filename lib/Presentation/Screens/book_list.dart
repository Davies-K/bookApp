import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Utils/app_utils.dart';
import 'package:book_app/widgets/book_card.dart';
import 'package:book_app/widgets/page_title.dart';
import 'package:book_app/widgets/search_box.dart';
import 'package:flutter/material.dart';

class BookListPage extends StatefulWidget {
  BookListPage({Key? key}) : super(key: key);
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.SIZE_32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: AppSizes.HEIGHT_20),
        PageTitle(title: StringConst.BOOKLIST_TITLE),
        const SizedBox(height: AppSizes.HEIGHT_20),
        SearchBox(
          placeholder: StringConst.SEARCH,
          controller: _searchController,
          onChanged: (String) {},
        ),
        const SizedBox(height: AppSizes.HEIGHT_20),
        Text(StringConst.FAMOUS_BOOKS,
            style: AppUtils.getTextTheme(context)
                .headline5
                ?.copyWith(fontSize: AppSizes.TEXT_SIZE_20)),
        const SizedBox(height: AppSizes.HEIGHT_20),
        BookCard()
      ]),
    ));
  }
}
