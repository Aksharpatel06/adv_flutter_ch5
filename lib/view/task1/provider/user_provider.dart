
import 'dart:convert';

import 'package:adv_flutter_ch5/view/task1/modal/user_modal/main_modal.dart';
import 'package:flutter/material.dart';

import '../screen/api/componects/api_sarvice.dart';

class UserProvider extends ChangeNotifier{

  List<MainModal> _usersList = [];

  List<MainModal> get usersList => _usersList;

  UserProvider(){
    getData();
  }

  Future<void> getData() async {
    String json = await ApiService().callApi('https://jsonplaceholder.typicode.com/users');
    List data = await jsonDecode(json);

    // convert into object data
    _usersList = data.map((e) => MainModal.fromJson(e)).toList();

    notifyListeners();
  }
}