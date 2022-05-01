import 'package:shopapp/helper/api.dart';

// Get All Categories From Api

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products/category/");
    return data;
  }
}
