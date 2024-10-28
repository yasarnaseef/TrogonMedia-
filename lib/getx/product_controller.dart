// controllers/product_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/productModel.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse('https://fake-store-api.mock.beeceptor.com/api/products'),
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        products.value =
            jsonData.map((json) => Product.fromJson(json)).toList();
      } else {
        errorMessage('Failed to load products');
      }
    } catch (e) {
      errorMessage('An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }
}
