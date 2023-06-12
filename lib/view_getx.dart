// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'controler.dart';

// class UserListView extends StatelessWidget {
//   final postController = Get.put(PostController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Users'),
//       ),
//       body: Obx(() {
//         if (postController.isLoading.value) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//           return ListView.builder(
//             itemCount: postController.post.length,
//             itemBuilder: (context, index) {
//               final post = postController.post[index];
//               return ListTile(
//                 title: Text(post.title),
//                 subtitle: Text(post.body),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }