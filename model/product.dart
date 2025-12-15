import 'rating.dart';

class Product {
  int id;
  String title;
  dynamic price;
  String description;
  String image;
  String category;
  Rating rating;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json["title"] ?? '',
      price: json["price"] ?? 0,
      category: json["category"] ?? '',
      description: json["description"] ?? '',
      image: json["image"] ?? '',
      rating: Rating.fromJson(json["rating"]),
    );
  }
}
