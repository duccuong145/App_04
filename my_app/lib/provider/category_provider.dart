import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  Future<List<Category>> getCategory() async {
    const url = 'http://apiforlearning.zendvn.com/api/mobile/categories';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      List<Category> data = List<Category>.from(
          jsonData.map((cate) => Category.fromJson(jsonEncode(cate)))).toList();
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> getProduct(id) async {
    final url =
        'http://apiforlearning.zendvn.com/api/mobile/categories/$id/products';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      // List<Category> data = List<Category>.from(
      //     jsonData.map((cate) => Category.fromJson(jsonEncode(cate)))).toList();
      // return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
