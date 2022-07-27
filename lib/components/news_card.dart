import 'package:flutter/material.dart';
import 'package:wordpressapi/model/category_model.dart';
import 'package:wordpressapi/model/news_model.dart';
import 'package:wordpressapi/screens/news_details/news_details.dart';
import 'package:wordpressapi/utilites/layout_utility.dart';
 class NewCardWidget extends StatelessWidget {
   final NewsModel model;
   final CategoryModel modelcategory;
  NewCardWidget({this.model, this.modelcategory,});
   @override
   Widget build(BuildContext context) {
     return Card(
       elevation: 0,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(16.0)
       ),
       child: InkWell(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const NewDetails()));
         },
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Stack(
               children: [
                 ClipRRect(
                   borderRadius:const BorderRadius.only(
                     topLeft: Radius.circular(16.0),
                     topRight: Radius.circular(16.0)
                   ),
                   child: Image.network(model.imageUrl)
                 ),
                 Align(
                   alignment: Alignment.topRight,
                   child: Container(
                     padding: const EdgeInsets.all(10),
                     margin: const EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       color: Colors.green,
                       borderRadius: BorderRadius.circular(15)
                     ),
                     child: Text(model.title == null ? '' : model.title,
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 15,
                       fontWeight: FontWeight.bold
                     ),),
                   ),
                 )
               ],
             ),
             Padding(padding: const EdgeInsets.all(15),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(model.title == null ? '' : model.title,
                 textAlign: TextAlign.center,
                   style: const TextStyle(fontSize: 16),
                 ),
                 const SizedBox(height: 16.0),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     LayoutUtils.iconText(const Icon(Icons.timer_outlined), Text(model.postedDate)),
                     GestureDetector(
                       onTap: (){},
                       child: const Icon(Icons.favorite_border),
                     )
                   ],
                 )
               ],
             ),
             )
           ],
         ),
       ),
     );
   }
 }
 