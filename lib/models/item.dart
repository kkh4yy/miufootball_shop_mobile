// models/item.dart
class Item {
  final int id;
  final String name;
  final double price;
  final String description;
  final String thumbnail;
  final String category;
  final bool isFeatured;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      thumbnail: json['thumbnail'],
      category: json['category'],
      isFeatured: json['is_featured'],
    );
  }
}
