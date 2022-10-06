import 'package:api_exercies/store/models/rating_model.dart';

class ItemModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rate;

  ItemModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rate,
  });

  ItemModel.fromJSON(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    price = json["price"].toDouble();
    description = json["description"];
    category = json["category"];
    image = json["image"];
    rate = Rating.fromJSON(json["rating"]);
  }

  Map<String, dynamic> toJSON(){
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": rate!.toJSON(),
    };
  }

}
