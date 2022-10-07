import 'package:flutter/cupertino.dart';

class CategoryViewModel with ChangeNotifier{
  final String title = "Shopping";
  final List<Map<String, String>> categoryList = [
    {
      "text": "All",
      "imagePath":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAqpTBs_pvnU0ZnnRJYPdmplUZpUzmEdPJQQ&usqp=CAU"
    },
    {
      "text": "men's clothing",
      "imagePath":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAqpTBs_pvnU0ZnnRJYPdmplUZpUzmEdPJQQ&usqp=CAU"
    },
    {
      "text": "women's clothing",
      "imagePath":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgczLBkBF5Hlitz3q1eBf8btOBN5IqPyW6ng&usqp=CAU"
    },
    {
      "text": "electronics",
      "imagePath":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOf5eng_vqnPB1El7N2GikfsEZfLVzU6PNVw&usqp=CAU"
    },
    {
      "text": "jewelery",
      "imagePath":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHFvenDq4nX-LgsmrRPamE9i-NMBkefW7Lzg&usqp=CAU"
    },
  ];
}
