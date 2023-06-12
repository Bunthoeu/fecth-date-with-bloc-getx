import 'package:flutter/material.dart';
import 'package:flutter_rest_api/login_screen/service_login.dart';
import 'package:get/get.dart';
import '../post_model.dart';
class SearchController extends GetxController {
  final DataService _postService = DataService();

  final searchTextController = TextEditingController();
  final results = <Post>[].obs;
  final isLoading = true.obs;

  void search() async {
    isLoading.value = true;
    final searchText = searchTextController.text.trim();
    final posts = await _postService.searchData(searchText);
    results.value = posts;
    isLoading.value = false;
  }
}
