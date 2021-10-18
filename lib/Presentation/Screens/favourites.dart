import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Models/book.dart';
import 'package:book_app/Services/Firestore/firestore_service.dart';
import 'package:book_app/widgets/book_card.dart';
import 'package:book_app/widgets/page_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  final String title;
  Favourites({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  FirestoreService fireService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.SIZE_32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: AppSizes.HEIGHT_20),
        PageTitle(title: widget.title),
        const SizedBox(height: AppSizes.HEIGHT_20),
        Expanded(
            child: StreamBuilder<QuerySnapshot>(
          stream: fireService.streamFavourites(firebaseUser),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            }

            final bookdoc = snapshot.data!.docs;
            var books = [];
            for (var book in bookdoc) {
              var ideavar = book.data();
              books.add(ideavar!);
            }

            var listItems = List<BookCard>.generate(books.length, (i) {
              Book bookObject = Book(
                  id: books[i]['bookDetails']['id'],
                  author: books[i]['bookDetails']['author'],
                  category:
                      _formatCategory(books[i]['bookDetails']['category']),
                  ratings: books[i]['bookDetails']['ratings'],
                  image: books[i]['bookDetails']['image'],
                  title: books[i]['bookDetails']['title']);
              return BookCard(
                book: bookObject,
                pageName: "fav",
              );
            });

            if (listItems.length == 0) {
              return Center(
                  child: Text("No Favourites Added 😒",
                      style: Theme.of(context).textTheme.bodyText1));
            }

            return ListView(children: [...listItems]);
          },
        ))
      ]),
    ));
  }

  String? _formatCategory(String category) {
    if (category == "N/A") {
      return category;
    }
    final split = category.split('/');
    final Map<int, String> values = {
      for (int i = 0; i < split.length; i++) i: split[i]
    };
    return values[0];
  }
}
