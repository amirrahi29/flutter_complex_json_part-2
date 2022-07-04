import 'package:flutter/material.dart';
import 'package:flutter_complex_json_part2/view_model/ShopViewModel.dart';
import 'package:get/get.dart';

class ShowView extends StatefulWidget {
  const ShowView({Key? key}) : super(key: key);

  @override
  _ShowViewState createState() => _ShowViewState();
}

class _ShowViewState extends State<ShowView> {

  final shopViewModel = Get.put(ShopViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Obx(()=>
            shopViewModel.isLoding.value == true?
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
                :
                ListView.builder(
                  itemCount: shopViewModel.shopList.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Container(
                                child: Text(shopViewModel.shopList[index].name!),
                              ),

                              Divider(),

                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemCount: shopViewModel.shopList[index].productModel!.length,
                                    itemBuilder: (context,index1){
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[

                                          Container(
                                            margin:EdgeInsets.all(8),
                                            child: Text(shopViewModel.shopList[index].productModel![index1].title!+"\nRs "+
                                                shopViewModel.shopList[index].productModel![index1].price!),
                                          ),

                                          SizedBox(
                                            height: 60,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                                itemCount: shopViewModel.shopList[index].productModel![index1].imageModel!.length,
                                                itemBuilder: (context,index2){
                                                  return Container(
                                                    height: 50,
                                                    width: 50,
                                                    margin: EdgeInsets.all(8.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(16),
                                                      image: DecorationImage(
                                                        image: NetworkImage(shopViewModel.shopList[index].productModel![index1].imageModel![index2].url!),
                                                        fit: BoxFit.cover
                                                      )
                                                    ),
                                                  );
                                                }
                                            ),
                                          )

                                        ],
                                      );
                                    }
                                ),
                              )

                            ],
                          ),
                        ),
                      );
                    }
                )
          ),
        )
    );
  }
}
