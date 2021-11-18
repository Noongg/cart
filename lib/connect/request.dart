import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:test_flutter_shoping/models/product.dart';

const URL_API='https://6103552d79ed68001748249c.mockapi.io/api/user/users';

class RequestApi {
  static Future<List<Product>> getProduct() async {
    final response = await http.get(Uri.parse(URL_API));
    if (response.statusCode == 200) {
      var list=jsonDecode(response.body) as List<dynamic>;
      List<Product> products=list.map((e) => Product.fromJson(e)).toList();
      return products;
    } else {
      throw Exception('Failed to load album');
    }
  }
}

