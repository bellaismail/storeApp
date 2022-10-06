

import 'package:api_exercies/posts/repositories/post_repository.dart';

import '../models/post_model.dart';

class PostsFirebase extends PostRepository{
  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<PostModel> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

}