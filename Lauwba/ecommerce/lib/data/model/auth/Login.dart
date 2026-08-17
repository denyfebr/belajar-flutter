/// token : {"accessToken":{"name":"user_token","abilities":["*"],"expires_at":"2025-12-06T04:52:35.000000Z","tokenable_id":1,"tokenable_type":"App\\Models\\User","updated_at":"2025-12-03T04:52:35.000000Z","created_at":"2025-12-03T04:52:35.000000Z","id":4},"plainTextToken":"4|HEQLFrJHwVw5dv31r72jEFg37jq5tLbpUNB9jbur26d8efee"}
/// message : "Login Success!"

class Login {
  Login({
      Token? token, 
      String? message,}){
    _token = token;
    _message = message;
}

  Login.fromJson(dynamic json) {
    _token = json['token'] != null ? Token.fromJson(json['token']) : null;
    _message = json['message'];
  }
  Token? _token;
  String? _message;
Login copyWith({  Token? token,
  String? message,
}) => Login(  token: token ?? _token,
  message: message ?? _message,
);
  Token? get token => _token;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_token != null) {
      map['token'] = _token?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// accessToken : {"name":"user_token","abilities":["*"],"expires_at":"2025-12-06T04:52:35.000000Z","tokenable_id":1,"tokenable_type":"App\\Models\\User","updated_at":"2025-12-03T04:52:35.000000Z","created_at":"2025-12-03T04:52:35.000000Z","id":4}
/// plainTextToken : "4|HEQLFrJHwVw5dv31r72jEFg37jq5tLbpUNB9jbur26d8efee"

class Token {
  Token({
      AccessToken? accessToken, 
      String? plainTextToken,}){
    _accessToken = accessToken;
    _plainTextToken = plainTextToken;
}

  Token.fromJson(dynamic json) {
    _accessToken = json['accessToken'] != null ? AccessToken.fromJson(json['accessToken']) : null;
    _plainTextToken = json['plainTextToken'];
  }
  AccessToken? _accessToken;
  String? _plainTextToken;
Token copyWith({  AccessToken? accessToken,
  String? plainTextToken,
}) => Token(  accessToken: accessToken ?? _accessToken,
  plainTextToken: plainTextToken ?? _plainTextToken,
);
  AccessToken? get accessToken => _accessToken;
  String? get plainTextToken => _plainTextToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_accessToken != null) {
      map['accessToken'] = _accessToken?.toJson();
    }
    map['plainTextToken'] = _plainTextToken;
    return map;
  }

}

/// name : "user_token"
/// abilities : ["*"]
/// expires_at : "2025-12-06T04:52:35.000000Z"
/// tokenable_id : 1
/// tokenable_type : "App\\Models\\User"
/// updated_at : "2025-12-03T04:52:35.000000Z"
/// created_at : "2025-12-03T04:52:35.000000Z"
/// id : 4

class AccessToken {
  AccessToken({
      String? name, 
      List<String>? abilities, 
      String? expiresAt, 
      num? tokenableId, 
      String? tokenableType, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _name = name;
    _abilities = abilities;
    _expiresAt = expiresAt;
    _tokenableId = tokenableId;
    _tokenableType = tokenableType;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  AccessToken.fromJson(dynamic json) {
    _name = json['name'];
    _abilities = json['abilities'] != null ? json['abilities'].cast<String>() : [];
    _expiresAt = json['expires_at'];
    _tokenableId = json['tokenable_id'];
    _tokenableType = json['tokenable_type'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _name;
  List<String>? _abilities;
  String? _expiresAt;
  num? _tokenableId;
  String? _tokenableType;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
AccessToken copyWith({  String? name,
  List<String>? abilities,
  String? expiresAt,
  num? tokenableId,
  String? tokenableType,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => AccessToken(  name: name ?? _name,
  abilities: abilities ?? _abilities,
  expiresAt: expiresAt ?? _expiresAt,
  tokenableId: tokenableId ?? _tokenableId,
  tokenableType: tokenableType ?? _tokenableType,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get name => _name;
  List<String>? get abilities => _abilities;
  String? get expiresAt => _expiresAt;
  num? get tokenableId => _tokenableId;
  String? get tokenableType => _tokenableType;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['abilities'] = _abilities;
    map['expires_at'] = _expiresAt;
    map['tokenable_id'] = _tokenableId;
    map['tokenable_type'] = _tokenableType;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}