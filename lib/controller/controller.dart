import 'package:get/get.dart';
import 'package:test_flutter_shoping/connect/request.dart';
import 'package:test_flutter_shoping/models/cartitem.dart';
import 'package:test_flutter_shoping/models/product.dart';

class HomeController extends GetxController{
  List<Product> listData=<Product>[].obs;
  RxMap _items = {}.obs;
  var count =0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  void getData() async{
    var result= await RequestApi.getProduct();
    if(result!=null){
      listData.assignAll(result);
    }else{
      print('lỗi');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  Map<int, CartItem> get items {
    return {..._items};
  }
  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void removeitem(int productId){
    _items.remove(productId);
    count--;
  }
  void removeProduct(int index){
    _items.update(index, (value) => CartItem(
        id: value.id,
        title: value.title,
        quantity: value.quantity -1,
        price: value.price
    ));
    if(_items.values.toList()[index].quantity==0){
      removeitem(index);
    }
    totalAmount;
  }
  void plusProduct(int index){
    _items.update(index, (value) => CartItem(
        id: value.id,
        title: value.title,
        quantity: value.quantity +1,
        price: value.price
    ));
    totalAmount;
  }
  void addProduct(int index,String id,String title,int price){

    if (_items.containsKey(index)) {
      _items.update(
          index,
              (value) => CartItem(
              id: value.id,
              title: value.title,
              quantity: value.quantity + 1,
              price: value.price));
    } else {
      count++;
      _items.putIfAbsent(
        index,
            () => CartItem(
          id: id,
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
  }
  int get itemCount{
    return listData.length;
  }

}
