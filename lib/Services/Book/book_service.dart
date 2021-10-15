import 'dart:convert';

import 'package:book_app/Constants/app_constants.dart';
import 'package:book_app/Mixins/base_repository_mixins.dart';
import 'package:book_app/Models/book.dart';
import 'package:book_app/Models/book_details.dart';
import 'package:book_app/Repositories/book/book_service_repository.dart';

class BookService with BaseRepository implements BookServiceRepository {
  @override
  Future<List<Book>> getBooks() async {
    try {
      List<Book> books = [];
      await get(url: "$booksBaseUrl").then((value) {
        var decodedResponse = jsonDecode(value.body);
        for (var book in decodedResponse["data"])
          books.add(Book.fromJson(book));
      });
      return books;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<BookDetails> getBookDetails(String bookId) async {
    try {
      late Map<String, String> book;
      await get(url: "$booksBaseUrl/$bookId").then((value) {
        var decodedResponse = jsonDecode(value.body);
        book = decodedResponse["data"];
      });
      return BookDetails.fromJson(book);
    } catch (e) {
      throw e;
    }
  }
}
