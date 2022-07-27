import 'dart:convert';

List<CategoryModel> categoryFromJson(String str)=>
    List<CategoryModel>.from(json.decode(str).map((x)=>CategoryModel.formJson(x),),);

class CategoryModel{
  String categoryName;
  int categoryId;
  int count;
  CategoryModel({this.count, this.categoryId, this.categoryName});
  CategoryModel.formJson(Map<String, dynamic>Json){
    categoryId=Json["id"];
    categoryName=Json["name"];
    count=Json["count"];
  }

}