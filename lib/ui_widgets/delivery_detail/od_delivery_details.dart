import 'package:flutter/material.dart';
import 'package:home_water_service_rider/model/OrderHistoryModel.dart';

import 'od_headings.dart';

class OdDeliveryDetails extends StatelessWidget {
  final OrderHistoryModel orderDetail;

  const OdDeliveryDetails({super.key, required this.orderDetail});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      OdHeadings(
        title: "${orderDetail.productsId?[0].name}",
        titleSize: 10,
        underLineWidth: 0,
        underLinePadding: 0,
        fontWeight: FontWeight.w600,
        textColor: Colors.black,
        flex: 1,
        center: true,
      ),
      OdHeadings(
        title: "${orderDetail.productsId?[0].price}",
        titleSize: 10,
        underLineWidth: 0,
        underLinePadding: 0,
        fontWeight: FontWeight.w600,
        textColor: Colors.black,
        flex: 1,
        center: true,
      ),
      OdHeadings(
        title: "150",
        titleSize: 10,
        underLineWidth: 0,
        underLinePadding: 0,
        fontWeight: FontWeight.w600,
        textColor: Colors.black,
        flex: 1,
        center: true,
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
