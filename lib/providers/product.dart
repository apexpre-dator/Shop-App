import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id, title, description, imageUrl;
  final double price;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.isFavourite = false,
  });

  Future<void> toggleFavourite() async {
    final prev = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url = Uri.parse(
        'https://shop-app-f8428-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json');
    try {
      final response = await http.patch(
        url,
        body: json.encode({'isFavourite': isFavourite}),
      );
      if (response.statusCode >= 400) {
        isFavourite = prev;
        notifyListeners();
      }
    } catch (error) {
      isFavourite = prev;
      notifyListeners();
    }
  }
}
