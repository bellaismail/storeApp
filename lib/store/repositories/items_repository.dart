import 'package:api_exercies/store/models/item_model.dart';

abstract class ItemsRepository{
  Future<List<ItemModel>> getAllItems();
}