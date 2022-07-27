import 'dart:convert';
import 'package:intl/intl.dart';

List<NewsModel>postsFromJson(String str)=>
    List<NewsModel>.from(json.decode(str).map((x)=>NewsModel.fromJson(x),),);
NewsModel postDetailsFromJson(String str)=>NewsModel.fromJson(json.decode(str));

class NewsModel{
  int id, categoryId;
  String imageUrl, postedDate, title, categoryName, postContent;

  NewsModel({
    this.categoryName,
    this.categoryId,
    this.id,
    this.imageUrl,
    this.postContent,
    this.postedDate,
    this.title
});
  NewsModel.fromJson(Map<String, dynamic> json){
    id=json['id'];
    title=json['slug'];
    imageUrl=json['jetpack_featured_media_url'];
    postedDate=DateFormat("dd-MMM-yyyy").format(DateTime.parse(json['date']));
    categoryName=json['slug'];
    if(json['content']!=null){
      postContent=json['rendered'];
    }
  }
}
