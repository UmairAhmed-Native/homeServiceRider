import 'package:flutter/material.dart';
import 'package:home_water_service_rider/model/OrderHistoryModel.dart';
import 'package:home_water_service_rider/ui_widgets/delivery_detail/od_delivery_details.dart';
import 'package:home_water_service_rider/ui_widgets/delivery_detail/od_delivery_header.dart';

import '../../utils/text_styles.dart';
import 'od_buttons.dart';

Widget OdBody(BuildContext context,
    OrderHistoryModel orderDetail,
    Function openMapDirection) => Positioned(
      top: 120,
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 5,
            right: 5,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          // Ensure scrolling is always enabled
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (orderDetail.id != null)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Customer ID: ",
                      style: boldTextStyle(
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                    Text("${orderDetail.orderId}",
                        style: boldTextStyle(
                          color: Colors.black,
                          size: 18,
                        ))
                  ],
                ),
              const Divider(
                color: Colors.black,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
              if (orderDetail.driver?.name != null)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Customer Name",
                        style: secondaryTextStyle(
                          color: Colors.black,
                          size: 12,
                        )),
                    Text("${orderDetail.driver?.name}",
                        style: secondaryTextStyle(
                          color: Colors.black,
                          size: 12,
                        ))
                  ],
                ),
              if (orderDetail.driver?.phone != null)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Customer Phone Number",
                        style: secondaryTextStyle(
                          color: Colors.black,
                          size: 12,
                        )),
                    Text("${orderDetail.driver?.phone}",
                        style: secondaryTextStyle(
                          color: Colors.black,
                          size: 12,
                        ))
                  ],
                ),
              const Divider(
                color: Color(0xFF676767),
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              OdDeliveryHeader(orderDetail: orderDetail),
              OdDeliveryDetails(orderDetail: orderDetail),
              const Divider(
                color: Colors.black,
                thickness: 2,
                indent: 0,
                endIndent: 0,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total Payment : ",
                    style: boldTextStyle(
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  Text("${orderDetail.payment}",
                      style: boldTextStyle(
                        color: Colors.black,
                        size: 18,
                      ))
                ],
              ),
              SizedBox(height: 20,),
              OdButtons(openMapDirection: () {
                openMapDirection();
              },)
            ],
          ),
        ),
      ),
    );
