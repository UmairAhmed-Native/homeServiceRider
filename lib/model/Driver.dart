class Driver {
  Driver({
      this.id, 
      this.driverId, 
      this.name, 
      this.email, 
      this.password, 
      this.phone, 
      this.address, 
      this.lat, 
      this.long, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Driver.fromJson(dynamic json) {
    id = json['_id'];
    driverId = json['driverId'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  num? driverId;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? lat;
  String? long;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['driverId'] = driverId;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['address'] = address;
    map['lat'] = lat;
    map['long'] = long;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}