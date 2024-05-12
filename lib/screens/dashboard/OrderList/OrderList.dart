import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_water_service_rider/model/OrderHistoryModel.dart';

import '../../../global_widgets/HorizontalDynamicTextWidget.dart';
import '../../../utils/global_functions.dart';
import '../../OrderDetail/OrderDetail.dart';

class OrderList extends StatelessWidget {
  final OrderHistoryModel order;

  OrderList({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Stack(
          children: [
            startJobContainerView(context),
            jobContainerView(context, order),
          ],
        ),
        SizedBox(height: 20),
      ],
    ));
  }

  Widget jobContainerView(BuildContext context, OrderHistoryModel jobsModel) =>
      Card(
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: RadialGradient(radius: 5, colors: [
                Colors.white,
                Colors.grey,
              ])),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              jobDetailsContainer(context, order),
              jobStatusContainer(context, order)
            ],
          ),
        ),
      );

  Widget jobStatusContainer(
          BuildContext context, OrderHistoryModel jobsModel) =>
      Container(
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
                        textStyle: TextStyle(
                            fontSize: 8,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.normal))),
              ),
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      );

  Widget startJobContainerView(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: Colors.blue,
          ),
          width: MediaQuery.of(context).size.width,
          height: 240,
          child: Container(
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
                        onStartPress(context, order);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
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

  Widget jobDetailsContainer(
      BuildContext context, OrderHistoryModel jobsModel) {
    List<String> productList = [];
    num totalPayment = 0;
    for (var products in order.productsId ?? []) {
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
                    "Customer ID: ${jobsModel.orderId}",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  HorizontalDynamicTextWiget(order.driver?.name ?? "",
                      [order.driver?.phone ?? ""], "|"),
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
                          ["${order.payment}"], "|", true, false, false),
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
                    "${order.userId?.address}",
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

  void onStartPress(BuildContext context, OrderHistoryModel jobDetail) =>
      {pushName(context, OrderDetail(orderDetail: jobDetail))};
}
