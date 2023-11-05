import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int id;
  String name;
  String image;
  int price;
  int price_sale_of;
  int rating;
  bool special;
  String Summary;
  String description;
  bool is_new;
  int category_id;
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.price_sale_of,
    required this.rating,
    required this.special,
    required this.Summary,
    required this.description,
    required this.is_new,
    required this.category_id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'price_sale_of': price_sale_of,
      'rating': rating,
      'special': special,
      'Summary': Summary,
      'description': description,
      'is_new': is_new,
      'category_id': category_id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
      price_sale_of: map['price_sale_of'] as int,
      rating: map['rating'] as int,
      special: map['special'] as bool,
      Summary: map['Summary'] as String,
      description: map['description'] as String,
      is_new: map['is_new'] as bool,
      category_id: map['category_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}