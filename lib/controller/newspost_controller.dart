

import 'package:get/get.dart';
import 'package:wordpressapi/model/news_model.dart';
import 'package:wordpressapi/services/api_services.dart';

class PostsComtroller extends GetxController{
  var isloading=true.obs;
  var postlist = <NewsModel>[].obs;

  @override
  void onInit(){
    super.onInit();
  }
  Future<void> fetchpost({int categoryId=1}) async{
    try{
      isloading(true);
      var posts = await APIService.fetchpost(categoryId);
      postlist.clear();

      if(posts!=null){
        postlist.addAll(posts);
      }
    }
    finally{
      isloading(false);
    }
  }

}