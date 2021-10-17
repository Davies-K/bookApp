import 'package:book_app/Core/Enums/loading.dart';
import 'package:book_app/Models/book.dart';
import 'package:flutter/material.dart';

class FavouriteListProvider with ChangeNotifier {
  List<Book> _favourites = [];
  LoadingState _isLoadingResults = LoadingState.busy;
  LoadingState get isLoadingResults => _isLoadingResults;
  List<Book> get favourites => _favourites;
}
