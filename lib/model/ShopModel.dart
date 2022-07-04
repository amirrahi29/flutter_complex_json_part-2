import 'package:flutter_complex_json_part2/model/ProductModel.dart';

class ShopModel{

  String? name;
  String? description;
  List<ProductModel>? productModel;

  ShopModel({this.name,this.description,this.productModel});

  factory ShopModel.fromJson(Map<String,dynamic> json){
    return ShopModel(
      name: json['name'],
      description: json['description'],
      productModel: (json['products'] as List).map((e) => ProductModel.fromJson(e)).toList(),
    );
  }

}