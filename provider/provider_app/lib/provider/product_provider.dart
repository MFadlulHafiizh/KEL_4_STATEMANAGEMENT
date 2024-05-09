import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_app/model/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  String url = "https://fakestoreapi.com/products";
  List<Product> _productList = [];
  List<Product> get productList => _productList;

  Future<void> fetchData() async {
    try {
      final resp = await http.get(Uri.parse(url));
      if (resp.statusCode == 200) {
        final productList = jsonDecode(resp.body);
        for (var element in productList) {
          _productList.add(Product.fromJson(element));
        }

        notifyListeners();
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
