import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Core/Databases/firestore_db.dart';
import 'package:book_app/Core/Factories/book_factory.dart';
import 'package:book_app/Models/book_details.dart';
import 'package:book_app/Presentation/Layout/adaptive_layout.dart';
import 'package:book_app/Utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  final String bookid;
  final String? pageName;
  BookDetailsScreen({Key? key, required this.bookid, this.pageName})
      : super(key: key);

  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  BookFactory _bookFactory = BookFactory();
  FireStoreDB firestoreDB = FireStoreDB();
  bool _isProcessing = false;
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return Scaffold(
        body: FutureBuilder<BookDetails>(
      future: _bookFactory.getBookDetails(widget.bookid),
      // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<BookDetails> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Platform.isAndroid
              ? Center(child: CircularProgressIndicator())
              : Center(child: CupertinoActivityIndicator());
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            return Scaffold(
              body: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: heightOfScreen(context) * 0.5,
                    child:
                        Image.network(snapshot.data!.image!, fit: BoxFit.cover),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 48,
                        left: 32,
                      ),
                      child: BackButton()),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: heightOfScreen(context) * 0.5,
                      padding: EdgeInsets.only(top: 64),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                right: 32,
                                left: 32,
                                bottom: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(snapshot.data!.title!,
                                      style: AppUtils.getTextTheme(context)
                                          .headline5),
                                  Text(snapshot.data!.author!,
                                      style: AppUtils.getTextTheme(context)
                                          .headline1),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star_half,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(snapshot.data!.ratings!,
                                            style:
                                                AppUtils.getTextTheme(context)
                                                    .headline5),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Text(snapshot.data!.description!,
                                          style: AppUtils.getTextTheme(context)
                                              .bodyText2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: widthOfScreen(context),
                            padding: EdgeInsets.only(
                              top: 16,
                              left: 32,
                              right: 32,
                              bottom: 32,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isProcessing = true;
                                });
                                widget.pageName == "fav"
                                    ? firestoreDB
                                        .deleteBook(
                                            snapshot.data!, firebaseUser.uid)
                                        .then((value) => Navigator.pop(context))
                                    : firestoreDB
                                        .postBook(
                                            snapshot.data!, firebaseUser.uid)
                                        .then(
                                            (value) => Navigator.pop(context));
                              },
                              child: _isProcessing
                                  ? Platform.isAndroid
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Center(
                                          child: CupertinoActivityIndicator())
                                  : Container(
                                      width: double.infinity,
                                      // width: widthOfScreen(context) / 2 - 44,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: widget.pageName == "fav"
                                                ? Colors.red.withOpacity(0.4)
                                                : Colors.grey.withOpacity(0.4),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                        border: Border.all(
                                          color: widget.pageName == "fav"
                                              ? Colors.red
                                              : Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget.pageName == "fav"
                                                  ? "Remove"
                                                  : "Add to Favourites",
                                              style:
                                                  AppUtils.getTextTheme(context)
                                                      .headline6,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(
                                              widget.pageName == "fav"
                                                  ? Icons.delete
                                                  : Icons.content_copy,
                                              color: AppColors.primaryColor,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 32,
                          bottom: (heightOfScreen(context) * 0.5) - (75 / 2)),
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.all(0),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data!.image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ); // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    ));
  }
}
