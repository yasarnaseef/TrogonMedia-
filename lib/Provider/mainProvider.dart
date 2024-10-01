import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {


  Future<void> product() async {
    try {
      final response = await http.get(Uri.parse('https://swan.alisonsnewdemo.online/api/home?id='));
      if (response.statusCode == 200) {
       // print("dknuidhcuys "+response.body.toString());
       log(response.body);
      }
    } catch (e) {
    }

    notifyListeners();
  }

}