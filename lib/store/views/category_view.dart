import 'package:api_exercies/store/repositories/items_api.dart';
import 'package:api_exercies/store/view_models/category_view_model.dart';
import 'package:api_exercies/store/view_models/store_home_view_model.dart';
import 'package:api_exercies/store/views/store_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryViewModel data = CategoryViewModel();

  @override
  void initState() {
    context.read<StoreHomeViewModel>().getAllItems(ItemsAPI());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<String> storeProvider =
        Provider.of<StoreHomeViewModel>(context, listen: true).allCategory;
    List<Map<String, String>> cateProvider =
        Provider.of<CategoryViewModel>(context, listen: true).categoryList;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: storeProvider.isNotEmpty
          ? GridView.builder(
              itemCount: storeProvider.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                mainAxisExtent: 300,
              ),
              itemBuilder: (context, index) {
                return CategoryCard(
                  imagePath: "${cateProvider[index]["imagePath"]}",
                  text: storeProvider[index],
                  categoryName: storeProvider[index],
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  String? imagePath, text, categoryName;

  CategoryCard({
    required this.imagePath,
    required this.text,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoreHomeView(
              categoryName: categoryName!,
            ),
          ),
        );
      },
      child: Card(
        elevation: 10.0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        child: Container(
          width: screenSize.width / 3,
          height: screenSize.height / 4,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("$imagePath"),
              fit: BoxFit.cover,
              opacity: 0.8,
            ),
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              "$text",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
* Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StoreHomeView(categoryName: categoryName!,)));
        },
        child: Card(
          elevation: 10.0,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          child: Container(
            width: screenSize.width / 3,
            height: screenSize.height / 4,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("$imagePath"),
                fit: BoxFit.cover,
                opacity: 0.8,
              ),
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                "$text",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ),
    )
* */
