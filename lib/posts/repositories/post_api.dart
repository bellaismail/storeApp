import 'dart:convert';
import 'package:api_exercies/posts/repositories/post_repository.dart';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class PostApi extends PostRepository {
  @override
  Future<List<PostModel>> getAllPosts() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    List<PostModel> posts = [];
    try {
      var res = await http.get(Uri.parse(url));
      var body = jsonDecode(res.body) as List;
      posts = body.map((json) => PostModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("something wrong on fetch all posts function");
    }
    return posts;
  }

  // @override
  // Future<List<PostModel>> getAllPosts() async {
  //   String url = "https://jsonplaceholder.typicode.com/posts";
  //   List<PostModel> posts = [];
  //   try {
  //     var res = await http.get(Uri.parse(url));
  //     var body = jsonDecode(res.body) as List;
  //     posts = body.map((json) => PostModel.fromJson2(json)).toList();
  //   } catch (e) {
  //     throw Exception("something wrong on fetch all posts function");
  //   }
  //   print("***${posts[1].title}///");
  //   return posts;
  // }

  // @override
  // Future<List<PostModel>> getAllPosts() async {
  //   String url = "https://jsonplaceholder.typicode.com/posts";
  // List<PostModel> posts = [];
  //   try {
  //     var res = await http.get(Uri.parse(url));
  //     var body = jsonDecode(res.body) as List;
  //     posts =  body
  //         .map((json) => PostModel(
  //             id: json["id"],
  //             userId: json["userId"],
  //             title: json["title"],
  //             body: json["body"]))
  //         .toList();
  //   } catch (e) {
  //     throw Exception("something wrong on fetch all posts function");
  //   }
  // print("***${posts[1].title}///");
  // return posts;
  // }

  @override
  Future<PostModel> getPostById(int id) {
    throw UnimplementedError();
  }
}
