import 'dart:convert';
import 'package:flutter_complex_json_part2/model/ShopModel.dart';
import 'package:http/http.dart' as http;

class ShopRepository{

  static var client = http.Client();
  static Future<List<ShopModel>?> fetchAllShops() async{
    var response = await client.get(Uri.parse("https://webhook.site/198d223b-cedd-416a-8605-1e94da59c3f8"));
    if(response.statusCode == 200)
      {
        var convertedJsonData = jsonDecode(response.body)['data'];
        return (convertedJsonData as List).map((e) => ShopModel.fromJson(e)).toList();
      }
    else
      {
        return null;
      }
  }
}