class PostModel {
  int? id;
  int? userId;
  String? title;
  String? body;

  PostModel({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    title = json["title"];
    body = json["body"];
  }

  PostModel.fromJson2(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        title = json["title"],
        body = json["body"];

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "body": body,
    };
  }
}
