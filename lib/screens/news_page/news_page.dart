import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpressapi/components/news_card.dart';
import 'package:wordpressapi/controller/newspost_controller.dart';

class NewsPage extends StatefulWidget {
  int categoryId;
  bool isRelod;
  NewsPage({Key key, this.categoryId, this.isRelod}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PostsComtroller postsComtroller=Get.put(PostsComtroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async{
      if(this.widget.isRelod)
      {
        await postsComtroller.fetchpost(categoryId: this.widget.categoryId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return newsList();
  }
  Widget newsList(){
    return Container(
      child: Obx((){
        if(postsComtroller.isloading.value)
        return Center(child: CircularProgressIndicator(),);
        {
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: postsComtroller.postlist.length,
            itemBuilder: (context, index){
              return NewCardWidget(
                model: postsComtroller.postlist[index],
              );
            },
          );
        }
      }),
    );
  }
}
