/// data : [{"id":1,"image":"https://onlineprint.co.id/blog/wp-content/uploads/2024/11/Cetak-Banner_desain-profesional.jpg","description":"quo sit minima","created_at":"2025-12-01T03:06:24.000000Z","updated_at":"2025-12-01T03:06:24.000000Z"},{"id":2,"image":"https://onlineprint.co.id/blog/wp-content/uploads/2024/11/Cetak-Banner_desain-profesional.jpg","description":"qui ex rerum","created_at":"2025-12-01T03:06:24.000000Z","updated_at":"2025-12-01T03:06:24.000000Z"},{"id":3,"image":"https://onlineprint.co.id/blog/wp-content/uploads/2024/11/Cetak-Banner_desain-profesional.jpg","description":"at in fugiat","created_at":"2025-12-01T03:06:24.000000Z","updated_at":"2025-12-01T03:06:24.000000Z"}]
/// message : "Fetch carousel success!"

class ListCarousel {
  ListCarousel({
      List<Data>? data, 
      String? message,}){
    _data = data;
    _message = message;
}

  ListCarousel.fromJson(dynamic json) {
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
ListCarousel copyWith({  List<Data>? data,
  String? message,
}) => ListCarousel(  data: data ?? _data,
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
/// image : "https://onlineprint.co.id/blog/wp-content/uploads/2024/11/Cetak-Banner_desain-profesional.jpg"
/// description : "quo sit minima"
/// created_at : "2025-12-01T03:06:24.000000Z"
/// updated_at : "2025-12-01T03:06:24.000000Z"

class Data {
  Data({
      num? id, 
      String? image, 
      String? description, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _image = image;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _image;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  String? image,
  String? description,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  image: image ?? _image,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get image => _image;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}