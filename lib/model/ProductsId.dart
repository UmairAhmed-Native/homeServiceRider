class ProductsId {
  ProductsId({
      this.id, 
      this.name, 
      this.slug, 
      this.price, 
      this.category, 
      this.size, 
      this.rating, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  ProductsId.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    price = json['price'];
    category = json['category'];
    size = json['size'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? slug;
  num? price;
  String? category;
  String? size;
  num? rating;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['price'] = price;
    map['category'] = category;
    map['size'] = size;
    map['rating'] = rating;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}