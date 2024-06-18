import 'dart:convert';

import 'package:flutter/material.dart';

import '../helper/api_sarvice.dart';

class HomeProvider extends ChangeNotifier {
  Map data = {};
  TextEditingController textEditingController = TextEditingController();

  bool isLoading = false;

  Future<void> fetchData(String categoey) async {
    isLoading = true;
    notifyListeners();
    ApiSarvice apiSarvice = ApiSarvice();
    String? json = await apiSarvice.apiCalling(categoey);
    data = jsonDecode(json!);
    isLoading = false;
    notifyListeners();
  }

  HomeProvider() {
    fetchData('nature');
  }
}
