import 'package:flutter/material.dart';
import 'package:flutter_rest_api/service.dart';
import 'post_model.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late Future<List<Post>> _data;
  @override
  void initState() {
    //  _serVices.getPost().then((post) {
    //     setState(() {
    //       _data = post;
    //     });
    //   });
    super.initState();
   _data = Services.getPost();
  }

  // Future<void> _deletePost(int postId) async {
  //   try {
  //     await Services.deleteData(postId);
  //     setState(() {
  //       _data = getPost();
  //     });
  //   } catch (e) {
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text('${e.toString()}'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<List<Post>>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];
                  return Card(
                    child: InkWell(
                      onTap: () {
                        // _deletePost(data.id);
                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return AlertDialog(
                        //         title: Text("Confirm"),
                        //         content: Text(
                        //             "Are you sure you want to delete this item?"),
                        //         actions: <Widget>[
                        //           TextButton(
                        //             onPressed: () =>
                        //                 Navigator.of(context).pop(false),
                        //             child: Text("Cancel"),
                        //           ),
                        //           TextButton(
                        //             onPressed: () async {

                        //               //deleteData(data.id);
                        //             // await _deletePost(data.id);

                        //               Navigator.of(context).pop(true);
                        //             },
                        //             child: Text("Delete"),
                        //           ),
                        //         ],
                        //       );
                        //     });
                      },
                      child: ListTile(
                        title: Text(data.title),
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          }),
    ));
  }
}
