class Book {
  String? id;
  String? title;
  String? ratings;
  String? image;
  String? author;
  String? category;

  Book(
      {this.id,
      this.title,
      this.ratings,
      this.image,
      this.author,
      this.category});

  factory Book.fromJson(Map<dynamic, dynamic> json) {
    return Book(
        id: json['id'],
        title: json['volumeInfo']['title'],
        ratings: json['volumeInfo']['averageRating'] == null
            ? "N/A"
            : json['volumeInfo']['averageRating'].toString(),
        image: json['volumeInfo']['imageLinks']['thumbnail'],
        category: json['volumeInfo']['categories'] == null
            ? "N/A"
            : json['volumeInfo']['categories'][0],
        author: json['volumeInfo']['authors'][0]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'ratings': this.ratings,
      'image': this.image,
      'author': this.author,
      'category': this.category
    };
  }
}
