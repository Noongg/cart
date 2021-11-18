import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_shoping/Cart.dart';
import 'package:test_flutter_shoping/controller/controller.dart';

class InfoProduct extends StatelessWidget {
  InfoProduct({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.listData[index].title}'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Get.to(Cart());
                },
                icon: Icon(Icons.shopping_cart),
              ),
              Positioned(
                  top: 10,
                  right: 8,
                  child: Obx(() => Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
                      child: Text(
                        '${controller.count}',
                        style: TextStyle(color: Colors.white),
                      ))))
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Image.network(
            controller.listData[index].imageUrl,
            fit: BoxFit.cover,
          ),
          Text(controller.listData[index].title),
          Text("${controller.listData[index].price}"),
          ElevatedButton(
              onPressed: () {
                controller.addProduct(
                    index,
                    controller.listData[index].id,
                    controller.listData[index].title,
                    controller.listData[index].price);
              },
              child: Icon(Icons.shopping_cart))
        ],
      ),
    );
  }
}
