class Product {
  late String title;
  late String imageUrl;
  late String description;
  late int price;
  late bool isFavourite;
  late String id;

  Product(
      {required this.title,
        required this.imageUrl,
        required this.description,
        required this.price,
        required this.isFavourite,
        required this.id});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    price = json['price'];
    isFavourite = json['isFavourite'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['price'] = this.price;
    data['isFavourite'] = this.isFavourite;
    data['id'] = this.id;
    return data;
  }
}