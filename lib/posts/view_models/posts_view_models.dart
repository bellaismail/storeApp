


import '../view_models/post_view_model.dart';
import '../models/post_model.dart';
import '../repositories/post_repository.dart';

class PostsViewModel{
  final String title = "All Posts";

  PostRepository postRepository;
  PostsViewModel({required this.postRepository});

  Future<List<PostViewModel>> fetchAllPosts() async{
    List<PostModel> list = await postRepository.getAllPosts();
    return list.map((postModel) => PostViewModel(postModel: postModel)).toList();
  }
}