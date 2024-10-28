// pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/Screens/productDetailsPage_Screen.dart';
import '../getx/product_controller.dart';
import '../model/productModel.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Store')),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (productController.errorMessage.isNotEmpty) {
          return Center(child: Text(productController.errorMessage.value));
        }
        return ListView(
          children: [
            buildHorizontalList('New Arrivals', productController.products),
            buildHorizontalList('Trending Products', productController.products),
          ],
        );
      }),
    );
  }

  Widget buildHorizontalList(String title, List<Product> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () => Get.to(() => ProductDetailsPage(product: product)),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: productImage('https://www.techjunkie.com/wp-content/uploads/2022/03/Moto-G-Stylus-660x430.png'), // Replace with dynamic URLs if available
                      ),
                      Text(product.name),
                      Text('Price: \$${product.price}'),
                      Text('Discounted: \$${(product.price * 0.9).toStringAsFixed(2)}'),
                      Text('Brand: ${product.brand}'),
                      Text('Rating: ${product.rating} ⭐'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
