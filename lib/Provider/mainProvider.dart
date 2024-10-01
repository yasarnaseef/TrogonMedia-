import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {


  Future<void> product() async {
    String id = "123";  // Example id
    String token = "abc123";  // Example token
    String slug = "furla-diamante-257";  // Slug from the API

    // API endpoint with the replaced slug
    String url = "https://swan.alisonsnewdemo.online/api/product-details/en?id=$id&token=$token&slug=$slug";

    // Send GET request
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse and print the JSON response
        var jsonResponse = jsonDecode(response.body);
        print("Response: $jsonResponse");
      } else {
        print("Failed to load product. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
    notifyListeners();
  }

}