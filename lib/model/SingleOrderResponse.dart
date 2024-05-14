import 'Orders.dart';

class SingleOrderResponse {
  bool? success;
  String? message;
  Orders? order;

  SingleOrderResponse({this.message, this.success, this.order});

  SingleOrderResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    order = json['orders'] != null ? Orders.fromJson(json['orders']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
      map['orders'] =order?.toJson();
    return map;
  }
}
