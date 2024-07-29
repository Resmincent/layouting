import 'package:flutter/material.dart';

class Cart {
  late final int? id;
  final String? title;
  final double? price;
  final ValueNotifier<int>? quantity;
  final String? brand;
  final String? thumbnail;

  Cart(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity,
      required this.brand,
      required this.thumbnail});

  Cart.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        title = data['title'],
        price = data['price'],
        quantity = ValueNotifier(data['quantity']),
        brand = data['brand'],
        thumbnail = data['thumbnail'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity?.value,
      'brand': brand,
      'thumbnail': thumbnail,
    };
  }

  Map<String, dynamic> quantityMap() {
    return {
      'quantity': quantity?.value,
    };
  }
}
