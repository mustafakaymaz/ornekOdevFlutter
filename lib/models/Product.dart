
class Product {
  int productId;
  String productName;
  String productType;

	Product({this.productId, this.productName, this.productType});

  Product.fromJson(Map<String, dynamic> map):
				productId = map["productId"],
		productName = map["productName"],
				productType = map["productType"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['productId'] = productId;
		data['productName'] = productName;
		data['productType'] = productType;
		return data;
	}
}
