
import 'package:flutter/material.dart';
import '../repositories/post_api.dart';
import '../view_models/post_view_model.dart';
import '../view_models/posts_view_models.dart';

class PostsView extends StatefulWidget {
  PostsView({Key? key}) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  PostsViewModel data = PostsViewModel(postRepository: PostApi());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool spinner = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: StreamBuilder(
          stream: data.fetchAllPosts().asStream(),
          builder: (context, AsyncSnapshot<List<PostViewModel>> snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              return ListView.builder(
                physics: null,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Title:",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                  color: Colors.indigo,
                                ),
                              ),
                              Text("${snapshot.data![index].title}"),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("ID: ${snapshot.data![index].id}"),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("UserId: ${snapshot.data![index].userId}"),
                        ],
                      ),
                    ],
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
