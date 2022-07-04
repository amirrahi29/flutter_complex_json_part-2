import 'package:flutter_complex_json_part2/model/ShopModel.dart';
import 'package:flutter_complex_json_part2/repositories/ShopRepository.dart';
import 'package:get/get.dart';

class ShopViewModel extends GetxController{

  var shopList = <ShopModel>[].obs;
  var isLoding = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllProducts();
  }

  Future<void> getAllProducts() async{
    var shop = await ShopRepository.fetchAllShops();
    if(shop != null)
      {
        shopList.value = shop;
        isLoding.value = false;
      }
  }

}