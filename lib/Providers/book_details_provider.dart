import 'package:book_app/Enums/loading.dart';
import 'package:book_app/Factories/book_factory.dart';
import 'package:book_app/Models/book_details.dart';
import 'package:flutter/material.dart';

// not needed because of future builder used on page.
class BookDetailsProvider extends ChangeNotifier {
  //BookDetails details = BookDetails();
  LoadingState _loadingState = LoadingState.busy;
  LoadingState get loadingState => _loadingState;
  BookFactory _bookFactory = BookFactory();

  Future<BookDetails> _getBookDetails(String id) async {
    _loadingState = LoadingState.idle;
    BookDetails details = BookDetails();
    try {
      details = await _bookFactory.getBookDetails(id);
    } catch (e) {}
    notifyListeners();
    return details;
  }
}
