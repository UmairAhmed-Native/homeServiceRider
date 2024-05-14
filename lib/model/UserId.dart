class UserId {
  UserId({
      this.id,
      this.address,
      this.phone});

  UserId.fromJson(dynamic json) {
    id = json['_id'];
    address = json['address'];
    phone = json['phone'];
  }
  String? id;
  String? address;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['address'] = address;
    map['phone'] = phone;
    return map;
  }

}