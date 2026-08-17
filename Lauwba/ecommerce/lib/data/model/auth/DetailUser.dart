/// user : {"id":8,"name":"Deny Febriyanto","email":"denyfebri@gmail.com","email_verified_at":null,"role":"USER","created_at":"2025-12-03T06:55:17.000000Z","updated_at":"2025-12-03T06:55:17.000000Z"}
/// message : "Fetch detail user success"

class DetailUser {
  DetailUser({
      User? user, 
      String? message,}){
    _user = user;
    _message = message;
}

  DetailUser.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _message = json['message'];
  }
  User? _user;
  String? _message;
DetailUser copyWith({  User? user,
  String? message,
}) => DetailUser(  user: user ?? _user,
  message: message ?? _message,
);
  User? get user => _user;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : 8
/// name : "Deny Febriyanto"
/// email : "denyfebri@gmail.com"
/// email_verified_at : null
/// role : "USER"
/// created_at : "2025-12-03T06:55:17.000000Z"
/// updated_at : "2025-12-03T06:55:17.000000Z"

class User {
  User({
      num? id, 
      String? name, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? role, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _role = role;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _role = json['role'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _role;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  num? id,
  String? name,
  String? email,
  dynamic emailVerifiedAt,
  String? role,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  role: role ?? _role,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get role => _role;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['role'] = _role;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}