import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'auth_controller.dart';

class LoginView extends StatelessWidget {
   final SearchController _searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController.searchTextController,
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _searchController.search,
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: _searchController.results.length,
                    itemBuilder: (context, index) {
                      final post = _searchController.results[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}