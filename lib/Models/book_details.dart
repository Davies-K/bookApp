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

  factory BookDetails.fromJson(Map<String, dynamic> json) {
    return BookDetails(
        id: json['id'],
        title: json['title'],
        ratings: json['ratings'],
        image: json['image'],
        category: json['category'],
        author: json['author'],
        description: json['description']);
  }
}
