import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_water_service_rider/model/DriverOrdersResponse.dart';
import 'package:home_water_service_rider/model/Orders.dart';
import 'package:home_water_service_rider/utils/Widget_extensions.dart';
import 'package:home_water_service_rider/utils/shared_preference/SharePreferece.dart';
import 'package:home_water_service_rider/utils/urls.dart';
import 'package:http/http.dart' as http;
import '../../../global_widgets/HorizontalDynamicTextWidget.dart';
import '../../../utils/global_functions.dart';
import '../../OrderDetail/OrderDetail.dart';

class OrderList extends StatefulWidget {
  final Orders order;

  OrderList({super.key, required this.order});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Stack(
          children: [
            if (widget.order.status != "Delivered") ...[
              startJobContainerView(context, isLoading)
            ],
            jobContainerView(context, widget.order),
          ],
        ),
        const SizedBox(height: 20),
      ],
    ));
  }

  Widget jobContainerView(BuildContext context, Orders jobsModel) => Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const RadialGradient(radius: 5, colors: [
                Colors.white,
                Colors.grey,
              ])),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              jobDetailsContainer(context, widget.order),
              jobStatusContainer(context, widget.order)
            ],
          ),
        ),
      );

  Widget jobStatusContainer(BuildContext context, Orders jobsModel) => SizedBox(
        width: 106,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text("Status"),
            Container(
              color: Colors.blue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                child: Text("${jobsModel.status}",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 10,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.normal))),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text("Estimated Time"),
            Container(
              color: Colors.blue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                child: Text("${jobsModel.dateAndTime}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 8,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.normal))),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
          ],
        ),
      );

  Widget startJobContainerView(BuildContext context, bool isLoading) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: Colors.blue,
          ),
          width: MediaQuery.of(context).size.width,
          height: 240,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // <-- spaceBetween
              children: <Widget>[
                const SizedBox(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Expanded(
                    child: GestureDetector(
                      onTap: () {
                        onStartPress(context, widget.order);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              )
                            : const Text(
                                "START",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: "fonts/Segoeui-Regular.otf"),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget jobDetailsContainer(BuildContext context, Orders jobsModel) {
    List<String> productList = [];
    num totalPayment = 0;
    for (var products in widget.order.productsId ?? []) {
      totalPayment += products?.price ?? 0;
      productList.add(products?.name);
    }
    return Container(
      width: 230,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Customer ID: ${jobsModel.userId?.id}",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  HorizontalDynamicTextWiget(widget.order.userId?.id ?? "",
                      [widget.order.userId?.phone ?? ""], "|"),
                  HorizontalDynamicTextWiget(
                      "Bottles", productList, ":", false, true, false),
                  Row(
                    children: [
                      Text("Payment: ",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 10,
                                  color: Color(0xC7626262),
                                  fontWeight: FontWeight.normal))),
                      HorizontalDynamicTextWiget("$totalPayment",
                          ["${widget.order.payment}"], "|", true, false, false),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.pin_drop, color: Colors.blue, size: 15),
                Container(
                  width: 150,
                  child: Text(
                    "${widget.order.userId?.address}",
                    maxLines: 3,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 10,
                            color: Color(0xC7626262),
                            fontWeight: FontWeight.normal)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> onStartPress(BuildContext context, Orders jobDetail) async {
    var response = await _startOrder(jobDetail.id ?? "");
    if (response) {
      OrderDetail(orderId: jobDetail.id ?? "").launch(context,isNewTask: true);

    }
  }

  Future<bool> _startOrder(String id) async {
    setState(() {
      isLoading = true;
    });

    try {
      Map<String, String>? headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjExMjkyNzhkYjMyNmI4M2JjMDdjY2YiLCJpYXQiOjE3MTU1NzQyMDMsImV4cCI6MTcxNjE3OTAwM30.h3m7YQYlWu9wcffcYMPAga5vE_9J7BTuprtGXXvM0QY'
      };

      var request = http.put(Uri.parse("${Url.updateOrder}$id"),
          body: jsonEncode(<String, String>{
            "status": "Processing",
          }),
          headers: headers);

      var response = await request;
      if (response.statusCode == 200) {
        print("Order Update${response.body}");
        SharedPreferencesManager.setOrderStatus("Processing");
        SharedPreferencesManager.setOrderId(id);
        setState(() {
          isLoading = false;
        });
        return true;
      } else {
        print("Order Update${response.body}");
        setState(() {
          isLoading = false;
        });
        return false;
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showToast('Error: $e');
      print(e);
      return false;
    }
  }
}
