import 'package:api_exercies/store/repositories/items_api.dart';
import 'package:api_exercies/store/view_models/store_home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreHomeView extends StatefulWidget {
  StoreHomeView({required this.categoryName});

  final String categoryName;

  @override
  State<StoreHomeView> createState() => _StoreHomeViewState();
}

class _StoreHomeViewState extends State<StoreHomeView> {
  StoreHomeViewModel data = StoreHomeViewModel();
  TextEditingController searchControl = TextEditingController();
  String text = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchControl.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<StoreHomeViewModel>(context, listen: true);
    var providerList =
        Provider.of<StoreHomeViewModel>(context, listen: true).productList;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: TextField(
                  controller: searchControl,
                  onChanged: (val) {
                    Provider.of<StoreHomeViewModel>(context, listen: false)
                        .searchFunction(val);
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: "Searching...",
                    hintStyle: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w900,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? screenSize.height * .07
                        : screenSize.height * .155,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.allCategory.length,
                  itemBuilder: (context, index) {
                    return CategorySmallCard(
                      categoryName: provider.allCategory[index],
                    );
                  },
                ),
              ),
              Expanded(
                child: (providerList.isEmpty)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: providerList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Image.network(
                                  "${providerList[index].image}",
                                  width: screenSize.width * .75,
                                  height: screenSize.height * .30,
                                ),
                                Text(
                                  "\"${providerList[index].title}\"",
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategorySmallCard extends StatefulWidget {
  CategorySmallCard({this.categoryName});

  String? categoryName;

  @override
  State<CategorySmallCard> createState() => _CategorySmallCardState();
}

class _CategorySmallCardState extends State<CategorySmallCard> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    Color textColor = Colors.indigo;
    return GestureDetector(
      onTap: (){
          Provider.of<StoreHomeViewModel>(context, listen: false).updateByCategory(widget.categoryName);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "${widget.categoryName}".toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w300,
              fontSize: 15.0,
            ),
          ),
        ),
        color: backgroundColor,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Colors.indigo,
          ),
        ),
        // elevation: 15.0,
      ),
    );
  }
}
