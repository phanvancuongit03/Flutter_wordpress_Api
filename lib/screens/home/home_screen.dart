import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpressapi/components/news_card.dart';
import 'package:wordpressapi/controller/category_controllers.dart';
import 'package:wordpressapi/screens/news_page/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Widget> tabs=[];
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // tabs.add(tab("technology"));
    // tabs.add(tab("sport"));
    // tabs.add(tab("game"));
    // tabs.add(tab("intenet"));
    // tabs.add(tab("developer"));
    // tabs.add(tab("helo"));
    // tabs.add(tab("developer"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(() {
        if (categoriesController.isloading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return DefaultTabController(
              length: categoriesController.categoriesList.length,
              child: Scaffold(
                appBar: AppBar(
                  // backgroundColor: Colors.white,
                  title: Center(
                    child: const Text(
                      "VCN SOFTWARE",
                      style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
                    ),
                  ),
                  elevation: 0,
                  bottom: TabBar(
                    tabs: categoriesController.categoriesList
                        .map((model) => tab(model.categoryName as String))
                        .toList(),
                    isScrollable: true,
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.cyan,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
                  actions: const <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.notifications_active,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: const [
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Text(
                          'Drawer Header',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('Messages'),
                      ),
                      ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text('Profile'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                    children: categoriesController.categoriesList
                        .map((model){
                          return NewsPage(categoryId: model.categoryId, isRelod: true,);
                    })
                        .toList()),
              ));
        }
      }),
    );
  }

  Widget tab(String tabName) {
    return Tab(
      text: tabName,
    );
  }
}
