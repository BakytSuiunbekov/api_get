import 'package:api_get/models/comment_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  CommentModel? commentModel;
  Future<void> getcomments() async {
    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/comments');
    if (response.statusCode == 200) {
      setState(() {
        commentModel = CommentModel(
          postId: response.data[0]['postId'],
          id: response.data[0]['id'],
          name: response.data[0]['name'],
          email: response.data[0]['email'],
          body: response.data[0]['body'],
        );
      });
    }
  }

  @override
  void initState() {
    getcomments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api exemple'),
      ),
      body: commentModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Card(
                child: ListTile(
                  leading: Text(commentModel!.postId.toString()),
                  title: Text(commentModel!.name),
                  subtitle: Text(commentModel!.body),
                  trailing: Text(commentModel!.email),
                ),
              ),
            ),
    );
  }
}
