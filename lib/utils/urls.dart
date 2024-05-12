class Url {
  static const baseUrl = "https://home-mineral-water-supply.vercel.app/api/v1/";


  static const  String registrationURL = '${Url.baseUrl}/user/signin';
  static const  String login = '${Url.baseUrl}auth/login-driver';
  static const  String getProduct = '${Url.baseUrl}product/get-product?slug=';
  static const  String postOrder = '${Url.baseUrl}orders/post-order';
  static const  String allOrders= '${Url.baseUrl}orders/all-orders';
}