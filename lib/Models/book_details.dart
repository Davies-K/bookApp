import 'book.dart';

class BookDetails extends Book {
  String? description;
  BookDetails({id, title, ratings, image, author, category, this.description})
      : super(
            id: id,
            title: title,
            ratings: ratings,
            image: image,
            author: author,
            category: category);

  factory BookDetails.fromJson(Map<dynamic, dynamic> json) {
    return BookDetails(
        id: json['id'],
        title: json['volumeInfo']['title'],
        ratings: json['volumeInfo']['averageRating'] == null
            ? "N/A"
            : json['volumeInfo']['averageRating'].toString(),
        image: json['volumeInfo']['imageLinks']['thumbnail'],
        category: json['volumeInfo']['categories'] == null
            ? "N/A"
            : json['volumeInfo']['categories'][0],
        author: json['volumeInfo']['authors'][0],
        description: json['volumeInfo']['description']);
  }
}
