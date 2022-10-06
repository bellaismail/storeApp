import 'dart:convert';

import 'package:api_exercies/store/models/item_model.dart';
import 'package:api_exercies/store/repositories/items_repository.dart';
import 'package:http/http.dart' as http;

class ItemsAPI extends ItemsRepository{
  @override
  Future<List<ItemModel>> getAllItems() async{
    String url = "https://fakestoreapi.com/products";
    List<ItemModel> items = [];
    try{
      http.Response res = await http.get(Uri.parse(url));
      if(res.statusCode == 200){
        var body = jsonDecode(res.body) as List;
        items = body.map((json) => ItemModel.fromJSON(json)).toList();
      }else{
        print("***Something error on status code***");
      }
    }catch(e){
      throw Exception("*******$e///////////////");
    }
    return items;
  }

}