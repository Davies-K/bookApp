import 'package:book_app/Models/book_details.dart';
import 'package:book_app/Models/book.dart';
import 'package:book_app/Core/Repositories/book/book_service_repository.dart';
import 'package:book_app/Services/Book/book_service.dart';

class BookFactory extends BookServiceRepository {
  BookService bookService = BookService();
  @override
  Future<BookDetails> getBookDetails(String bookId) async {
    return await bookService.getBookDetails(bookId);
  }

  @override
  Future<List<Book>> getBooks() async {
    return await bookService.getBooks();
  }
}
