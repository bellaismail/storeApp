// import 'package:api_exercies/store/models/item_model.dart';
// import 'package:api_exercies/store/repositories/items_repository.dart';
// import 'package:api_exercies/store/view_models/item_view_model.dart';
// import 'package:flutter/cupertino.dart';
//
// class StoreHomeViewModel with ChangeNotifier{
//   ItemsRepository? itemsRepository;
//   StoreHomeViewModel({this.itemsRepository});
//
//   List<ItemViewModel> productList = [];
//
//   Future<List<ItemViewModel>> getAllItems()async{
//     List<ItemModel> list = await itemsRepository!.getAllItems();
//     productList = list.map((itemModel) => ItemViewModel(itemModel: itemModel)).toList();
//     return productList;
//   }
// }

import 'package:api_exercies/store/models/item_model.dart';
import 'package:api_exercies/store/repositories/items_api.dart';
import 'package:api_exercies/store/repositories/items_repository.dart';
import 'package:api_exercies/store/view_models/item_view_model.dart';
import 'package:flutter/cupertino.dart';

class StoreHomeViewModel with ChangeNotifier {
  List<ItemViewModel> productList = [];
  List<String> allCategory = ["All"];

  getAllItems(ItemsRepository? itemsRepository) async {
    List<ItemModel> list = await itemsRepository!.getAllItems();
    productList =
        list.map((itemModel) => ItemViewModel(itemModel: itemModel)).toList();
    productList.forEach((itemModel) {
      if (!allCategory.contains(itemModel.category)) {
        allCategory.add(itemModel.category!);
      }
    });
    notifyListeners();
  }

  void searchFunction(String text) {
    if (text == "") {
      getAllItems(ItemsAPI());
    } else {
      productList = productList
          .where(
              (item) => item.title!.toLowerCase().contains(text.toLowerCase()))
          .toList();
      notifyListeners();
    }
  }

  void updateByCategory(String? cate) {
    if (cate!.toLowerCase() == "All".toLowerCase() || cate == "") {
      getAllItems(ItemsAPI());
    } else {
      print("************${productList.length}********************");
      getAllItems(ItemsAPI()).then((val) => productList = productList
          .where((element) =>
              (element.category!.toLowerCase() == cate.toLowerCase()))
          .toList());
      print("************${productList.length}********************");
    }
  }
}
