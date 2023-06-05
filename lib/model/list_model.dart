// To parse this JSON data, do
//
//     final listModel = listModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<ListModel> listModelFromJson(String str) =>
//     List<ListModel>.from(json.decode(str).map((x) => ListModel.fromJson(x)));

// String listModelToJson(List<ListModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final Category category;
  final List<String> images;

  ListModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

class Category {
  final int id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
