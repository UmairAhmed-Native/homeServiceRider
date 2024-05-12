
import 'User.dart';

class LoginResponse {
  bool? success;
  String? message;
  User? user;
  String? token;

  LoginResponse({
    this.success,
    this.message,
    this.user,
    this.token,});

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}