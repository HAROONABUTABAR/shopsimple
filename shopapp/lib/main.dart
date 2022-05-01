import 'package:flutter/material.dart';

import 'package:shopapp/screen/home_page.dart';
import 'package:shopapp/screen/update_product_page.dart';
import 'package:shopapp/services/update_product_services.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id :(context) => const HomePage(),
        UpdateProductPage.id:(context) => UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}