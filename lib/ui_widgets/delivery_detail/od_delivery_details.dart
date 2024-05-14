import 'package:flutter/material.dart';
import 'package:home_water_service_rider/model/Orders.dart';
import 'package:home_water_service_rider/model/ProductsId.dart';

import 'od_headings.dart';

class OdDeliveryDetails extends StatelessWidget {
  final List<ProductsId> productList;

  const OdDeliveryDetails({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (int i = 0; i < productList.length; i++) ...[
        OdHeadings(
          title: "${productList[i].name}",
          titleSize: 10,
          underLineWidth: 0,
          underLinePadding: 0,
          fontWeight: FontWeight.w600,
          textColor: Colors.black,
          flex: 1,
          center: true,
        ),
        OdHeadings(
          title: "01",
          titleSize: 10,
          underLineWidth: 0,
          underLinePadding: 0,
          fontWeight: FontWeight.w600,
          textColor: Colors.black,
          flex: 1,
          center: true,
        ),
        OdHeadings(
          title: "${productList[i].price}",
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
        )
      ]
    ]);
  }
}
