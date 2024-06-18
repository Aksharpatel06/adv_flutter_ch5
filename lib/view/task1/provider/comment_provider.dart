import 'dart:convert';
import 'package:adv_flutter_ch5/view/task1/modal/comment_modal/comment_modal.dart';
import 'package:flutter/material.dart';
import '../screen/api/componects/api_sarvice.dart';

class CommentProvider extends ChangeNotifier {
  List<CommentModal> _commentsList = [];

  List<CommentModal> get commentsList => _commentsList;

  CommentProvider() {
    getData();
  }

  Future<void> getData() async {
    String json = await ApiService()
        .callApi('https://jsonplaceholder.typicode.com/comments');
    List data = await jsonDecode(json);

    // convert into object data
    _commentsList = data.map((e) => CommentModal.fromJson(e)).toList();

    // Notify listeners after updating the data
    notifyListeners();
  }
}
