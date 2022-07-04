import 'package:flutter_complex_json_part2/model/ImageModel.dart';

class ProductModel{

  String? title;
  String? price;
  List<ImageModel>? imageModel;

  ProductModel({this.title,this.price,this.imageModel});

  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
      title: json['title'],
      price: json['price'],
      imageModel: (json['images'] as List).map((e) => ImageModel.fromJson(e)).toList(),
    );
  }

}