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
        title: json['title'],
        ratings: json['ratings'],
        image: json['image'],
        category: json['category'],
        author: json['author']);
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
