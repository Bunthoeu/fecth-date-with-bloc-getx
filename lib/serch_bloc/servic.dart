import 'dart:convert';

import 'package:flutter_rest_api/post_model.dart';
import 'package:http/http.dart' as http;

class SearchRepository {
  

  const SearchRepository();
  

  Future<List<Post>> search(String query) async {
    final baseUrl = 'https://jsonplaceholder.typicode.com';
    final response = await http.get(Uri.parse('$baseUrl/posts?q=$query'));
    final List<dynamic> json = jsonDecode(response.body);
    //final results = json['results'] as List<dynamic>;
    return json.map((result) => Post.fromJson(result)).toList();
  }
}