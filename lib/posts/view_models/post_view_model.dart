import '../models/post_model.dart';

class PostViewModel{
  PostModel? postModel;
  PostViewModel({this.postModel});

  int? get id => postModel?.id;
  int? get userId => postModel?.userId;
  String? get title => postModel?.title;
  String? get body => postModel?.body;
}