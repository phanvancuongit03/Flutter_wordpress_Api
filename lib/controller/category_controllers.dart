import 'package:get/get.dart';
import 'package:wordpressapi/model/category_model.dart';
import 'package:wordpressapi/services/api_services.dart';

class CategoriesController extends GetxController{
  var isloading = true.obs;
  var categoriesList = <CategoryModel>[].obs;
  @override
  void onInit(){
    fetchCategories();
    super.onInit();
  }
  Future<void> fetchCategories() async {
    try{
      isloading(true);
      var categories= await APIService.fetchCategories();
      if(categories.length>=0){
        categoriesList.clear();
        categoriesList.addAll(categories);
      }
    }
    finally{
      isloading(false);
      }
  }
}