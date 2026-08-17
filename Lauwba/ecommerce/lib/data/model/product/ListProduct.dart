/// data : [{"id":1,"name":"Iphone 15","category":"smartphone","price":13000000,"images":"https://www.hellostore.id/cdn/shop/products/iPhone13-Green.jpg?v=1756580147&width=246"},{"id":2,"name":"Phone case IP 15","category":"accessories","price":150000,"images":"https://down-id.img.susercontent.com/file/sg-11134201-23030-lrdr2y3xloov1a"},{"id":3,"name":"Chair","category":"furniture","price":1925000,"images":"https://parto.id/asset/foto_produk/id-11134207-7qul1-lgq1xeughp6bc9.jpeg"}]
/// message : "Fetch Product success!"

class ListProduct {
  ListProduct({
      List<Data>? data, 
      String? message,}){
    _data = data;
    _message = message;
}

  ListProduct.fromJson(dynamic json) {
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
ListProduct copyWith({  List<Data>? data,
  String? message,
}) => ListProduct(  data: data ?? _data,
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

/// id : 1
/// name : "Iphone 15"
/// category : "smartphone"
/// price : 13000000
/// images : "https://www.hellostore.id/cdn/shop/products/iPhone13-Green.jpg?v=1756580147&width=246"

class Data {
  Data({
      num? id, 
      String? name, 
      String? category, 
      num? price, 
      String? images,}){
    _id = id;
    _name = name;
    _category = category;
    _price = price;
    _images = images;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _category = json['category'];
    _price = json['price'];
    _images = json['images'];
  }
  num? _id;
  String? _name;
  String? _category;
  num? _price;
  String? _images;
Data copyWith({  num? id,
  String? name,
  String? category,
  num? price,
  String? images,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  category: category ?? _category,
  price: price ?? _price,
  images: images ?? _images,
);
  num? get id => _id;
  String? get name => _name;
  String? get category => _category;
  num? get price => _price;
  String? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['category'] = _category;
    map['price'] = _price;
    map['images'] = _images;
    return map;
  }

}