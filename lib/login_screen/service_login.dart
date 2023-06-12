import 'dart:convert';

import 'package:flutter_rest_api/post_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  final baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> searchData(String searchText) async {
    final url = '$baseUrl/posts?q=$searchText';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)as List<dynamic>;
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}