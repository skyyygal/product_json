class ProductModel {
  int? productId;
  String? productName;
  String? productDescription;
  String? productImg;
  double? price;

  ProductModel(
      {this.productId,
      this.productName,
      this.productDescription,
      this.productImg,
      this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productImg = json['product_img'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_description'] = productDescription;
    data['product_img'] = productImg;
    data['price'] = price;
    return data;
  }
}
