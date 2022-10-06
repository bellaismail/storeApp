import 'package:api_exercies/store/models/item_model.dart';
import 'package:api_exercies/store/models/rating_model.dart';

class ItemViewModel{
  ItemModel? itemModel;
  ItemViewModel({this.itemModel});

  int? get id => itemModel?.id;
  String? get title => itemModel?.title;
  double? get price => itemModel?.price;
  String? get description => itemModel?.description;
  String? get category => itemModel?.category;
  String? get image => itemModel?.image;
  Rating? get rate => itemModel?.rate;

}