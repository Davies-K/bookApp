import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Factories/book_factory.dart';
import 'package:book_app/Models/book_details.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  String? bookid;
  BookDetailsScreen({Key? key, String? bookid}) : super(key: key);

  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  BookFactory _bookFactory = BookFactory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.SIZE_32),
                child: Column(
                  children: [
                    const SizedBox(height: AppSizes.HEIGHT_20),
                    BackButton(color: AppColors.primaryColor),
                    FutureBuilder<BookDetails>(
                      future: _bookFactory.getBookDetails(widget.bookid!),
                      // function where you call your api
                      builder: (BuildContext context,
                          AsyncSnapshot<BookDetails> snapshot) {
                        // AsyncSnapshot<Your object type>
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: Text('Please wait its loading...'));
                        } else {
                          if (snapshot.hasError)
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          else
                            return Center(
                                child: new Text(
                                    '${snapshot.data}')); // snapshot.data  :- get your object which is pass from your downloadData() function
                        }
                      },
                    )
                  ],
                ))));
  }
}
