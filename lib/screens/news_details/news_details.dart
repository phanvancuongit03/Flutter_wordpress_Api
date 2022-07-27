import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wordpressapi/utilites/layout_utility.dart';
class NewDetails extends StatelessWidget {
  const NewDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network("https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/292238807_1713157552376975_4537443350276634478_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=yQtw3pvB3PgAX8ZrWVK&_nc_ht=scontent.fdad1-2.fna&oh=00_AT8K5brevvPaKt50efyUwxbIVbAk7kJn5jDSky93B8Be5A&oe=62D3CF21",
              fit: BoxFit.cover,),
            ),
            backgroundColor: Colors.transparent,elevation: 0, expandedHeight: 250,
          ),
          SliverFillRemaining(child: newsDetailSection(),)
        ],
      ),
    );
  }
  Widget newsDetailSection(){
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          row1(),
          LayoutUtils.iconText(const Icon(Icons.timer_outlined), const Text("01st Jan 2021")),
          const SizedBox(height: 15),
          const Text("đang teesst api wordpress yeh yeh",
          style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),),
          const SizedBox(
            width: 100,
            child: Divider(
              color: Colors.grey,
              thickness: 2,
            ),
          ),
          Expanded(child: Html(
            style: {
              "p": Style(color: Colors.grey, fontSize: FontSize.large)
            },
            data: "<p>test news</p><p>test news pargag 2</p>",
          ))
        ],
      ),
    );
  }
  Widget row1(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)
            ),
            child: const Text("Sport", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.shield_moon_outlined)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_add_outlined))
            ],
          ),
        )
      ],
    );
  }
}
