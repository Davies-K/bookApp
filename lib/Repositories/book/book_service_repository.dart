import 'package:book_app/Models/book.dart';
import 'package:book_app/Models/book_details.dart';

abstract class BookServiceRepository {
  Future<List<Book>> getBooks();
  Future<BookDetails> getBookDetails(String bookId);
}
