// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FakeProductModel {
    final int id;
    final String title;
    final double price;
    final String description;
    final String category;
    final String image;
    final Rating rating;

    FakeProductModel({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    FakeProductModel copyWith({
        int? id,
        String? title,
        double? price,
        String? description,
        String? category,
        String? image,
        Rating? rating,
    }) => 
        FakeProductModel(
            id: id ?? this.id,
            title: title ?? this.title,
            price: price ?? this.price,
            description: description ?? this.description,
            category: category ?? this.category,
            image: image ?? this.image,
            rating: rating ?? this.rating,
        );

    factory FakeProductModel.fromRawJson(String str) => FakeProductModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FakeProductModel.fromJson(Map<String, dynamic> json) => FakeProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
    };

  @override
  String toString() {
    return 'FakeProductModel(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }
}

class Rating {
    final double rate;
    final int count;

    Rating({
        required this.rate,
        required this.count,
    });

    Rating copyWith({
        double? rate,
        int? count,
    }) => 
        Rating(
            rate: rate ?? this.rate,
            count: count ?? this.count,
        );

    factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };

  @override
  String toString() => 'Rating(rate: $rate, count: $count)';
}
