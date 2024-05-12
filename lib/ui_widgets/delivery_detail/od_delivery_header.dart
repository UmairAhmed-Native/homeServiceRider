import 'package:flutter/material.dart';
import 'package:home_water_service_rider/model/OrderHistoryModel.dart';
import 'package:home_water_service_rider/ui_widgets/delivery_detail/od_headings.dart';


class OdDeliveryHeader extends StatelessWidget{
  final OrderHistoryModel orderDetail;

  const OdDeliveryHeader({super.key,required this.orderDetail});
  @override
  Widget build(BuildContext context) {
    return Row(
        children:[
          OdHeadings(
            title: "Product Name",
            underLineWidth:50 ,
            underLinePadding: 80,
            fontWeight: FontWeight.bold,
            textColor:  Colors.black,
            flex: 2,
            center: true,
          ),
          OdHeadings(
            title: "Quantity",
            underLineWidth:50 ,
            underLinePadding: 80,
            fontWeight: FontWeight.bold,
            textColor:  Colors.black,
            flex: 2,
            center: true,
          ),
          OdHeadings(
            title: "Price",
            secondaryTitle:"(per Unit)",
            underLineWidth:50 ,
            underLinePadding: 80,
            fontWeight: FontWeight.bold,
            textColor:  Colors.black,
            flex: 2,
            center: true,
          ),

        ]);
  }
}