/// data : [{"id":2,"product_id":1,"user_id":8,"qty":12,"created_at":"2025-12-04T04:36:20.000000Z","updated_at":"2025-12-04T04:36:20.000000Z","products":{"id":1,"name":"Iphone 15","category":"smartphone","price":13000000,"weight_gr":3,"description":"Distinctio sunt debitis alias et qui. Voluptatum inventore ad officiis laboriosam sit excepturi qui explicabo.","images":"[\"https:\\/\\/www.hellostore.id\\/cdn\\/shop\\/products\\/iPhone13-Green.jpg?v=1756580147&width=246\",\"https:\\/\\/cdnpro.eraspace.com\\/media\\/catalog\\/product\\/i\\/p\\/iphone_13_product_red_1.jpg\",\"https:\\/\\/indodana-web.imgix.net\\/assets\\/iphone-13-pro-max-alpine-green-thumbnail.png?auto=compress\",\"https:\\/\\/static.pasarwarga.com\\/imagescrop\\/product\\/550\\/product_temp_f4ed24b4a8c6fb737017a73242d7feab.jpeg\"]","created_at":"2025-12-01T03:06:24.000000Z","updated_at":"2025-12-01T03:06:24.000000Z"}}]
/// message : "Fetch cart success"

class ListCart {
  ListCart({
      List<Data>? data, 
      String? message,}){
    _data = data;
    _message = message;
}

  ListCart.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
  }
  List<Data>? _data;
  String? _message;
ListCart copyWith({  List<Data>? data,
  String? message,
}) => ListCart(  data: data ?? _data,
  message: message ?? _message,
);
  List<Data>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : 2
/// product_id : 1
/// user_id : 8
/// qty : 12
/// created_at : "2025-12-04T04:36:20.000000Z"
/// updated_at : "2025-12-04T04:36:20.000000Z"
/// products : {"id":1,"name":"Iphone 15","category":"smartphone","price":13000000,"weight_gr":3,"description":"Distinctio sunt debitis alias et qui. Voluptatum inventore ad officiis laboriosam sit excepturi qui explicabo.","images":"[\"https:\\/\\/www.hellostore.id\\/cdn\\/shop\\/products\\/iPhone13-Green.jpg?v=1756580147&width=246\",\"https:\\/\\/cdnpro.eraspace.com\\/media\\/catalog\\/product\\/i\\/p\\/iphone_13_product_red_1.jpg\",\"https:\\/\\/indodana-web.imgix.net\\/assets\\/iphone-13-pro-max-alpine-green-thumbnail.png?auto=compress\",\"https:\\/\\/static.pasarwarga.com\\/imagescrop\\/product\\/550\\/product_temp_f4ed24b4a8c6fb737017a73242d7feab.jpeg\"]","created_at":"2025-12-01T03:06:24.000000Z","updated_at":"2025-12-01T03:06:24.000000Z"}

class Data {
  Data({
      num? id, 
      num? productId, 
      num? userId, 
      num? qty, 
      String? createdAt, 
      String? updatedAt, 
      Products? products,}){
    _id = id;
    _productId = productId;
    _userId = userId;
    _qty = qty;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _products = products;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _userId = json['user_id'];
    _qty = json['qty'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _products = json['products'] != null ? Products.fromJson(json['products']) : null;
  }
  num? _id;
  num? _productId;
  num? _userId;
  num? _qty;
  String? _createdAt;
  String? _updatedAt;
  Products? _products;
Data copyWith({  num? id,
  num? productId,
  num? userId,
  num? qty,
  String? createdAt,
  String? updatedAt,
  Products? products,
}) => Data(  id: id ?? _id,
  productId: productId ?? _productId,
  userId: userId ?? _userId,
  qty: qty ?? _qty,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  products: products ?? _products,
);
  num? get id => _id;
  num? get productId => _productId;
  num? get userId => _userId;
  num? get qty => _qty;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Products? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['user_id'] = _userId;
    map['qty'] = _qty;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_products != null) {
      map['products'] = _products?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Iphone 15"
/// category : "smartphone"
/// price : 13000000
/// weight_gr : 3
/// description : "Distinctio sunt debitis alias et qui. Voluptatum inventore ad officiis laboriosam sit excepturi qui explicabo."
/// images : "[\"https:\\/\\/www.hellostore.id\\/cdn\\/shop\\/products\\/iPhone13-Green.jpg?v=1756580147&width=246\",\"https:\\/\\/cdnpro.eraspace.com\\/media\\/catalog\\/product\\/i\\/p\\/iphone_13_product_red_1.jpg\",\"https:\\/\\/indodana-web.imgix.net\\/assets\\/iphone-13-pro-max-alpine-green-thumbnail.png?auto=compress\",\"https:\\/\\/static.pasarwarga.com\\/imagescrop\\/product\\/550\\/product_temp_f4ed24b4a8c6fb737017a73242d7feab.jpeg\"]"
/// created_at : "2025-12-01T03:06:24.000000Z"
/// updated_at : "2025-12-01T03:06:24.000000Z"

class Products {
  Products({
      num? id, 
      String? name, 
      String? category, 
      num? price, 
      num? weightGr, 
      String? description, 
      String? images, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _category = category;
    _price = price;
    _weightGr = weightGr;
    _description = description;
    _images = images;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _category = json['category'];
    _price = json['price'];
    _weightGr = json['weight_gr'];
    _description = json['description'];
    _images = json['images'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _category;
  num? _price;
  num? _weightGr;
  String? _description;
  String? _images;
  String? _createdAt;
  String? _updatedAt;
Products copyWith({  num? id,
  String? name,
  String? category,
  num? price,
  num? weightGr,
  String? description,
  String? images,
  String? createdAt,
  String? updatedAt,
}) => Products(  id: id ?? _id,
  name: name ?? _name,
  category: category ?? _category,
  price: price ?? _price,
  weightGr: weightGr ?? _weightGr,
  description: description ?? _description,
  images: images ?? _images,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get category => _category;
  num? get price => _price;
  num? get weightGr => _weightGr;
  String? get description => _description;
  String? get images => _images;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['category'] = _category;
    map['price'] = _price;
    map['weight_gr'] = _weightGr;
    map['description'] = _description;
    map['images'] = _images;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}