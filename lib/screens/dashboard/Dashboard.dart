import 'dart:convert';

import 'package:flutter/material.dart';

import '../../main.dart';
import '../../model/OrderHistoryModel.dart';
import '../../utils/global_functions.dart';
import '../../utils/urls.dart';
import 'OrderList/OrderList.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            centerTitle: true,
            title: const Text("Rides", style: TextStyle(color: Colors.black))),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
                future: getAllOrders(),
                builder: (context, data) {
                  if (data.connectionState == ConnectionState.waiting) {
                    return Container(
                        width: 50,
                        height: 50,
                        color: Colors.white,
                        child:
                            const Center(child: CircularProgressIndicator()));
                  } else {
                    return ListView.builder(
                      itemCount: data.data?.length ??0,
                      itemBuilder: (context, index) {
                        return OrderList(order: data.data![index]);
                      },
                    );
                  }
                }) /*ListView.builder(
              itemCount: listsData.length,
              itemBuilder: (context, index) {
                return OrderList(order: listsData[index]);
              },
            )*/
            ));
  }
}

Future<List<OrderHistoryModel>?> getAllOrders() async {
  try {
    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'Authorization': token!
    };
    var request = http.get(Uri.parse(Url.allOrders), headers: headers);

    var response = await request;
    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      List<OrderHistoryModel> orderHistory = [];
      for (var item in jsonResponse) {
        orderHistory.add(OrderHistoryModel.fromJson(item));
      }

      return orderHistory;
    } else {
      showToast("Something went wrong");
    }
  } catch (e) {
    showToast('Error: $e');
    print(e);
    return null;
  }
}
