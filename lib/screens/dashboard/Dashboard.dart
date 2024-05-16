import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_water_service_rider/screens/profile/profileScreen.dart';
import '../../model/DriverOrdersResponse.dart';
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
            leading: IconButton(
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person_pin),
              ),
              onPressed: () => {pushName(context, ProfileScreen())},
            ),
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
                      itemCount: data.data?.orders?.length ?? 0,
                      itemBuilder: (context, index) {
                        return OrderList(order: data.data!.orders![index]);
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

Future<DriverOrdersResponse?>? getAllOrders() async {
  try {
    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjExMjkyNzhkYjMyNmI4M2JjMDdjY2YiLCJpYXQiOjE3MTU1NzQyMDMsImV4cCI6MTcxNjE3OTAwM30.h3m7YQYlWu9wcffcYMPAga5vE_9J7BTuprtGXXvM0QY'
    };
    var request = http.get(Uri.parse(Url.allOrders), headers: headers);

    var response = await request;
    if (response.statusCode == 200) {
      print(response.body);

      var driverOrders =
          DriverOrdersResponse.fromJson(jsonDecode(response.body));
      return driverOrders;
    } else {
      showToast("Something went wrong");
      return null;
    }
  } catch (e) {
    showToast('Error: $e');
    print(e);
    return null;
  }
}
