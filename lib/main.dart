import 'package:api_exercies/store/view_models/category_view_model.dart';
import 'package:api_exercies/store/view_models/store_home_view_model.dart';
import 'package:api_exercies/store/views/category_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StoreHomeViewModel()),
        ChangeNotifierProvider(create: (context) => CategoryViewModel()),
      ],
      builder: (context, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                color: Colors.lightGreen,
              ),
            ),
          ),
          home: CategoryView(),
        );
      },
    );
  }
}

/*
* ChangeNotifierProvider(
      create: (context) {
        return StoreHomeViewModel();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.lightGreen,
            ),
          ),
        ),
        home: CategoryView(),
      ),
    )
* */
