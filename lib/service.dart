import 'dart:convert';

import 'package:flutter_rest_api/post_model.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<Post>> getPost() async {
    final String apiUrl = 'https://jsonplaceholder.typicode.com/posts/';
    final respone = await http.get(Uri.parse(apiUrl));
    if (respone.statusCode == 200) {
      final List<dynamic> jsonRespon = jsonDecode(respone.body);
      return jsonRespon.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<void> deleteData(int post) async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$post'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete data');
    } else {
      // If the server did not return a 200 OK response, throw an error.
      throw Exception('Failed to delete data');
    }
  }
}
