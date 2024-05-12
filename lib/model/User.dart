class User {
  String? id;
  num? userId;
  String? email;
  String? phone;
  String? address;
  num? role;
  User({
      this.id, 
      this.userId, 
      this.email, 
      this.phone, 
      this.address, 
      this.role,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    userId = json['userId'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    role = json['role'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['userId'] = userId;
    map['email'] = email;
    map['phone'] = phone;
    map['address'] = address;
    map['role'] = role;
    return map;
  }

}