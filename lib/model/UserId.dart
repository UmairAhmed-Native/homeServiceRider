class UserId {
  UserId({
      this.id, 
      this.address,});

  UserId.fromJson(dynamic json) {
    id = json['_id'];
    address = json['address'];
  }
  String? id;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['address'] = address;
    return map;
  }

}