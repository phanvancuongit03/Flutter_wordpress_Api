
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wordpressapi/config.dart';
import 'package:wordpressapi/model/category_model.dart';
import 'package:wordpressapi/model/news_model.dart';
class APIService{
  static var client =http.Client();

  static Future<List<CategoryModel>> fetchCategories() async{
    try {
      var response = await client.get(
          Uri.parse(Config.apiUrl + Config.categoryUrl));
        var JsonString = response.body;
        return categoryFromJson(JsonString);
    } catch (Exc){
      if (kDebugMode) {
        print(Exc);
      }
      rethrow;
    }
  }

  static Future <List<NewsModel>> fetchpost(int categoryId) async{
    try {
    var response = await client.get(Uri.parse(Config.apiUrl + Config.postsUrl));

      var jsonString=response.body;
      return postsFromJson(jsonString);

  } catch (Exc){
  if (kDebugMode) {
  print(Exc);
  }
  rethrow;
  }
  }
}

