// models/product_model.dart
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String brand;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.brand,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['product_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      brand: json['brand'],
      rating: json['rating'].toDouble(),
    );
  }
}
