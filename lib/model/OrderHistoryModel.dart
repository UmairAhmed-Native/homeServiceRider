import 'ProductsId.dart';
import 'UserId.dart';
import 'Driver.dart';

class OrderHistoryModel {
  OrderHistoryModel({
      this.id, 
      this.productsId, 
      this.payment, 
      this.dateAndTime, 
      this.userId, 
      this.status, 
      this.lat, 
      this.long, 
      this.driver, 
      this.createdAt, 
      this.updatedAt, 
      this.orderId, 
      this.v,});

  OrderHistoryModel.fromJson(dynamic json) {
    id = json['_id'];
    if (json['productsId'] != null) {
      productsId = [];
      json['productsId'].forEach((v) {
        productsId?.add(ProductsId.fromJson(v));
      });
    }
    payment = json['payment'];
    dateAndTime = json['dateAndTime'];
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    status = json['status'];
    lat = json['lat'];
    long = json['long'];
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderId = json['orderId'];
    v = json['__v'];
  }
  String? id;
  List<ProductsId>? productsId;
  String? payment;
  String? dateAndTime;
  UserId? userId;
  String? status;
  String? lat;
  String? long;
  Driver? driver;
  String? createdAt;
  String? updatedAt;
  num? orderId;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (productsId != null) {
      map['productsId'] = productsId?.map((v) => v.toJson()).toList();
    }
    map['payment'] = payment;
    map['dateAndTime'] = dateAndTime;
    if (userId != null) {
      map['userId'] = userId?.toJson();
    }
    map['status'] = status;
    map['lat'] = lat;
    map['long'] = long;
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['orderId'] = orderId;
    map['__v'] = v;
    return map;
  }

}