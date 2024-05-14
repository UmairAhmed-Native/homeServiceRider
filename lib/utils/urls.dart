class Url {
  static const baseUrl = "https://home-mineral-water-supply.vercel.app/api/v1/";


  static const  String updateOrder = '${Url.baseUrl}orders/order-status/';
  static const  String login = '${Url.baseUrl}auth/login-driver';
  static const  String updateDriver = '${Url.baseUrl}auth/update-driver/';
  static const  String singleOrderDetail = '${Url.baseUrl}orders/get-single-order/';
  static const  String allOrders= '${Url.baseUrl}orders/get-orders-driver';
}