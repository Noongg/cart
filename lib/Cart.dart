import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_shoping/controller/controller.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(title: Obx(()=>Text('${controller.totalAmount}')),),
      body: ListView.builder(
        itemCount: controller.items.length,
          itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Row(
                children: [
                  Text('tên: ${controller.items.values.toList()[index].title} - '),
                  Text('giá: ${controller.items.values.toList()[index].price}đ'),
                  IconButton(
                    onPressed: (){
                      controller.plusProduct(index);
                    },
                    icon: Icon(Icons.add),
                  ),
                  Obx(()=>Text('${controller.items.values.toList()[index].quantity}'),),
                  IconButton(
                    onPressed: (){
                      controller.removeProduct(index);
                    },
                    icon: Icon(Icons.remove),
                  )
                ],
              ),
          );
          }),
    );
  }
}
