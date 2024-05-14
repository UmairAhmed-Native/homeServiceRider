import 'Orders.dart';

class DriverOrdersResponse {
  bool? success;
  String? message;
  List<Orders>? orders;

  DriverOrdersResponse({this.message, this.success, this.orders});

  DriverOrdersResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
