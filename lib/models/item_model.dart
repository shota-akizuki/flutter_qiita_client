import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'item.dart';

//APIからデータを取得するクラス

class ItemModel extends ChangeNotifier {
  List<Item> get items => _items;
  List<Item> _items = [];

  void search(String query) async {
    final http.Response res =
        await http.get("https://qiita.com//api/v2/items?query=$query");

    if (res.statusCode != 200) {
      throw HttpException(res.statusCode, "unable to fetch weather data");
    }

    final itemJson = json.decode(res.body) as List;
    _items = itemJson.map((data) => Item.fromJson(data)).toList();
    notifyListeners();
  }
}

//例外処理で投げるクラス
class HttpException implements Exception {
  final int code;
  final String message;

  HttpException(this.code, this.message) : assert(code != null);

  @override
  String toString() {
    return 'HTTPException{code: $code,message:$message}';
  }
}
