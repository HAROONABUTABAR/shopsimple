import 'package:flutter/material.dart';
import 'package:shopapp/models/product_model.dart';
import 'package:shopapp/services/update_product_services.dart';
import 'package:shopapp/widgets/custom_buttom.dart';
import 'package:shopapp/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);

  static String id = "updata product";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Product",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextFiled(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: "Product Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: "description",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  keyboardType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: "price",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFiled(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: "image",
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  onTap: () {
                    isLoading = true;
                    setState(() {});
                    try {
                      updateProduct(productModel);
                      print("success");
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  text: "Update",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel productModel) {
    UpdateProductService().updateProduct(
      title: productName == null ? productModel.title : productName!,
      price: price == null ? productModel.price.toString() : price!,
      description: desc == null ? productModel.description : desc!,
      image: image == null ? productModel.image : image!,
      category: productModel.category,
    );
  }
}
