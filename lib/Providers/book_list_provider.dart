import 'dart:collection';

import 'package:book_app/Core/Enums/loading.dart';
import 'package:book_app/Core/Factories/book_factory.dart';
import 'package:book_app/Models/book.dart';
import 'package:flutter/material.dart';

class BookListProvider extends ChangeNotifier {
  String _searchString = "";
  List<Book> _tmpbooks = [];
  late Future<List<Book>> _books = _getBookList();
  LoadingState _loadingState = LoadingState.busy;
  LoadingState get loadingState => _loadingState;
  BookFactory _bookFactory = BookFactory();
  int booksCount = 0;
  Future<List<Book>> get bookList => _books;

  UnmodifiableListView<Book> get tmpList => _searchString.isEmpty
      ? UnmodifiableListView(_tmpbooks)
      : UnmodifiableListView(_tmpbooks
          .where((book) => book.title!.toLowerCase().contains(_searchString)));

  Future<List<Book>> _getBookList() async {
    _tmpbooks = await _bookFactory.getBooks();
    booksCount = _tmpbooks.length;
    print(_tmpbooks);
    _loadingState = LoadingState.idle;
    notifyListeners();
    return _tmpbooks;
  }

  void changeSearchString(String searchString) {
    _searchString = searchString;
    notifyListeners();
  }

  _setLoading(bool state) {
    if (state)
      _loadingState = LoadingState.busy;
    else
      _loadingState = LoadingState.idle;
    notifyListeners();
  }
}
